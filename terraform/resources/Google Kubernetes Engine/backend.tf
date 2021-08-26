terraform {
  backend "gcs" {
    bucket = "efk-bucket"
    prefix = "efk/gke/state"
  }
}

