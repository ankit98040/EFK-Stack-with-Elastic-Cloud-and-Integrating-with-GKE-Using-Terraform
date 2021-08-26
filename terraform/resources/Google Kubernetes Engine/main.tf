resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
  depends_on = [
    google_compute_network.vpc_network
  ]
}


resource "google_compute_firewall" "firewall-gke" {
  name        = var.firewall_name
  network = google_compute_network.vpc_network.name
  description = "IAP Allow For GKE Node SSH"
  source_ranges = var.source_ranges

  allow {
    protocol = var.allow_protocol
    ports = var.port
  }
  depends_on = [
      google_compute_network.vpc_network
    ]
}

resource "google_container_cluster" "gke-cluster" {
  name     = var.gke_cluster_name
  location = var.region
  remove_default_node_pool = var.remove_default_nodes
  network    =  google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnet.name
  initial_node_count = var.node_count
  resource_labels = var.gke_label

   addons_config {
  http_load_balancing {
    disabled = var.http_check
  }
  }
 depends_on = [
  google_compute_network.vpc_network
 ]
}

resource "google_container_node_pool" "gke-nodes" {
  name       = var.gke_node_name
  location   = var.region
  cluster    = google_container_cluster.gke-cluster.name
  node_count = var.node_count
  node_locations = var.node_location
    autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }
  node_config {
    machine_type = var.node_type
    labels = var.gke_label
 } 
 
}



data "google_secret_manager_secret_version" "elastic_cloud_pwd" {
  secret  = var.secret_id[0]
  version = var.versions[0]
}

data "google_secret_manager_secret_version" "elastic_cloud_id" {
  secret  = var.secret_id[1]
  version = var.versions[1]
}
resource "null_resource" "updating_kubeconfig" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.gke-cluster.name} --region ${var.region} --project ${var.project_id}"
  }
}


resource "null_resource" "updating_filebeat_configmap" {
 provisioner "local-exec" {
 command = "sed -i 's/ELASTIC_PWD/${data.google_secret_manager_secret_version.elastic_cloud_pwd.secret_data}/' /home/onkarnaik/filebeat/filebeat-daemonset.yaml && sed -i 's/ELASTIC_ID/${data.google_secret_manager_secret_version.elastic_cloud_id.secret_data}/' /home/onkarnaik/filebeat/filebeat-daemonset.yaml"  
 } 
 depends_on = [
   null_resource.updating_kubeconfig
 ]
}

resource "null_resource" "deploying_filebeat" {
  provisioner "local-exec" {
    command = "kubectl apply -f /home/onkarnaik/filebeat/."
  }
  depends_on = [
    null_resource.updating_filebeat_configmap
    
  ]
}



