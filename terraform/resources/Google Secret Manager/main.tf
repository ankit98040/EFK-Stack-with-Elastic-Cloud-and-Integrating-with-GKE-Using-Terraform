resource "google_secret_manager_secret" "elastic_cloud_secret" {
  secret_id = "${var.secret_id}-${count.index+1}"
  count = var.data_count
  labels = var.secret_label
  replication {
    automatic = var.auto
  }

}
resource "google_secret_manager_secret_version" "secret-version" {
  secret = google_secret_manager_secret.elastic_cloud_secret[count.index].id
  count = var.data_count
  secret_data = var.secret_data["${count.index}"]
}


resource "google_secret_manager_secret_iam_binding" "binding" {
  count = var.data_count
  secret_id = google_secret_manager_secret.elastic_cloud_secret[count.index].id
  role = "roles/secretmanager.secretAccessor"
  members = [
    "user:${var.member_id}",
  ]
}
