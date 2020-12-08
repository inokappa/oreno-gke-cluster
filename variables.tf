variable "cluster_name" {
  type    = string
  default = "oreno-gke"
}

variable "location" {
  type    = string
  default = "us-central1-a"
}

variable "network" {
  type    = string
  default = "default"
}

variable "primary_node_count" {
  type    = string
  default = "1"
}

variable "master_auth_username" {
  type    = string
  default = ""
}

variable "master_auth_password" {
  type    = string
  default = ""
}

variable "oauth_scopes" {
  type = list(string)

  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append",
  ]
}

variable settings {
  type = map(string)

  default = {
    # dev
    "dev.project_id"             = ""
    "dev.project_name"           = "oreno-gke-dev"
    "dev.region"                 = "us-central1"
    "dev.zone"                   = "us-central1-a"
    "dev.location"               = "us-central1-a"
    "dev.machine_type"           = "n2-standard-2"
    "dev.node_count"             = 1
    "dev.preemptible_node_count" = 1

    # Default
    "default.project_id"             = "oreno-gke"
    "default.project_name"           = "oreno-gke"
    "default.region"                 = "us-central1"
    "default.zone"                   = "us-central1-a"
    "default.location"               = "us-central1-a"
    "default.machine_type"           = "n1-standard-1"
    "default.node_count"             = 1
    "default.preemptible_node_count" = 1
  }

  # GCP Region: https://cloud.google.com/compute/docs/regions-zones?hl=ja
}

variable "gke_manager" {
  description = "Roles for oreno-gke-manage service account"
  type        = map(string)

  default = {
    iam_project_admin = "roles/resourcemanager.projectIamAdmin"
    compute_admin     = "roles/compute.admin"
    storage_admin     = "roles/storage.admin"
    container_admin   = "roles/container.admin"
  }
}
