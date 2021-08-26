# Global variables
project_id = "PROJECT_ID"
region = "asia-south1"

# VPC & Subnet Variables
vpc_name = "gke-vpc"
auto_create = false
subnet_name = "gke-subnet"
subnet_range = "10.1.0.0/16"

# Firewall Variables
firewall_name = "gke-firewall"
source_ranges = [ "35.235.240.0/20" ]
allow_protocol = "ssh"
port = [ "22" ]

# Secret Manager
secret_id = [ "elastic_cloud_secret-2" , "elastic_cloud_secret-3"]
versions = [ "1" , "1" ]

# GKE variables
gke_cluster_name = "my-test-k8s"
remove_default_nodes = true
gke_node_name = "k8s-node-pool"
node_count = "1"
node_type = "e2-medium"
http_check = "false"
node_location = [ "asia-south1-a" , "asia-south1-b" ]
min_nodes = "1"
max_nodes = "4"
gke_label = { "owner" : "onkarnaik" }
