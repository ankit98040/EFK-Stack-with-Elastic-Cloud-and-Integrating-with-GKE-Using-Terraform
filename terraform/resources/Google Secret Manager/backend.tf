terraform {
  backend "gcs" {
    bucket = "efk-bucket"
    prefix = "efk/secret-manager/state"
  }
}

