resource "google_container_cluster" "cluster" {
  name     = "${var.cluster_name}-cluster"
  location = lookup(var.settings, "${terraform.workspace}.location")

  remove_default_node_pool = true
  initial_node_count       = 1

  network = var.network

  master_auth {
    username = var.master_auth_username
    password = var.master_auth_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "nodes" {
  name       = "${var.cluster_name}-nodes"
  location   = var.location
  cluster    = google_container_cluster.cluster.name
  node_count = lookup(var.settings, "${terraform.workspace}.node_count")

  management {
    auto_repair = true
  }

  node_config {
    machine_type = lookup(var.settings, "${terraform.workspace}.machine_type")
    oauth_scopes = var.oauth_scopes

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

resource "google_container_node_pool" "preemptible_nodes" {
  name       = "${var.cluster_name}-preemptible-nodes"
  location   = var.location
  cluster    = google_container_cluster.cluster.name
  node_count = lookup(var.settings, "${terraform.workspace}.preemptible_node_count")

  management {
    auto_repair = true
  }

  node_config {
    preemptible  = true
    machine_type = lookup(var.settings, "${terraform.workspace}.machine_type")
    oauth_scopes = var.oauth_scopes

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
