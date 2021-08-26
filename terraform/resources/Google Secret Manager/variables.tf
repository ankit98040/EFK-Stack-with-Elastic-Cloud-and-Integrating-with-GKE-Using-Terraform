variable "project_id" {
  type        = string
  description = "The GCP project ID"
}


variable "secret_id" {
   description = "The Secret ID" 
  
}

variable "secret_label" {
    description = "The Secret label"
  
}

variable "data_count" {
  description = "The Secret Count"
  
}
variable "auto" {
  description = "True or False"
}
variable "secret_data" {
  description = "the secret data"
}
variable "member_id" {
  description = "the IAM member ID"
  
}