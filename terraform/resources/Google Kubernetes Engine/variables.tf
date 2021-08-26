variable "project_id" {
description = "The GCP Project ID"
}
variable "vpc_name" {
description = "The VPC name"
}
variable "auto_create"{
    type = bool
    description = "subnet autocreate or not"
}
variable "subnet_name" {
description = "subnet name"
}
variable "subnet_range"{
description = "subnet IP range"
}
variable "firewall_name"{
description = "firewall name"
}
variable "port"{
    description = "firewall allow port"
}
variable "source_ranges" {
description = "firewall source IP ranges"
}

variable "secret_id"{
description = "the GCP secret ID"
}
variable "versions"{
description = "secret version"
}

variable "region" {
description = "the GCP region"
}
variable "gke_cluster_name" {
description = "GKE Cluster name"
}
variable "remove_default_nodes" {
description = "default node provisioning"
}

variable "gke_node_name" {
description = "GKE node name"
}

variable "gke_label"{
description = "GKE cluster labels"
}
variable "node_count" {
description = "GKE node count"
}

variable "node_type"{
description = "GKE node type"
}

variable "http_check" {
description = "GKE http load balancing "
}

variable "node_location"{
    description = "GKE node location"
}

variable "allow_protocol"{
description = "firewall allowed protocol"
}

variable "min_nodes"{
description = "GKE min node count"
}
variable "max_nodes"{
description = "GKE max node count"

}