terraform {
  required_providers {
    ec = {
      source = "elastic/ec"
      version = "0.2.1"
    }
  }
} 

provider "ec" {
  apikey = data.google_secret_manager_secret_version.elastic_cloud_apikey.secret_data
 }