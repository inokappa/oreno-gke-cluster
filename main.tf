provider "google" {
  project = lookup(var.settings, "${terraform.workspace}.project_id")
  region  = lookup(var.settings, "${terraform.workspace}.region")
}
