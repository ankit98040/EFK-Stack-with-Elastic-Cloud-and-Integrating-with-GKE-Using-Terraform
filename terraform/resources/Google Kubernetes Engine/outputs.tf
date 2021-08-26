output "vpc_ID" {
  value = google_compute_network.vpc_network.id
}

output "subnet_ID" {
   value = google_compute_subnetwork.vpc_subnet.id
}
