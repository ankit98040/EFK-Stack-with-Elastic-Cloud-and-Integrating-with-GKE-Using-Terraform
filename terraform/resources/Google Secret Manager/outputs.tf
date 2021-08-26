output "gke-secret-manager-id" { 
value = [ google_secret_manager_secret.elastic_cloud_secret[0].id , google_secret_manager_secret.elastic_cloud_secret[1].id ,google_secret_manager_secret.elastic_cloud_secret[2].id ]
}
