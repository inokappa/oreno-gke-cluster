resource "google_service_account" "gke-manager" {
  account_id   = "gke-manager"
  display_name = "Service Account for GKE Manage"
  description  = "Service Account for GKE Manage"
}

resource "google_project_iam_member" "gke-manager" {
  for_each = var.gke_manager

  project = lookup(var.settings, "${terraform.workspace}.project_id")
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke-manager.email}"
}
