data "ec_stack" "latest" {
  version_regex = "latest"
  region        = var.region
}

data "google_secret_manager_secret_version" "elastic_cloud_apikey" {
  secret  = var.secret_name
  version = var.version_number
}

resource "ec_deployment" "example_minimal" {
  name = var.deploy_name
  region                 = var.region
  version                = data.ec_stack.latest.version
  deployment_template_id = var.deploy_id

  elasticsearch {}

  kibana {}

  apm {}

  enterprise_search {}
}