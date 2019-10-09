terraform {
  backend "gcs" {
    bucket = "tf-state"
    prefix = "terraform/gke_state"
  }
}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.gke_location
  min_master_version       = var.min_master_version
  remove_default_node_pool = true
  initial_node_count       = 1 

  addons_config {
    kubernetes_dashboard {
      disabled = false
    } 
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.node_pool_name
  location   = var.gke_location
  cluster    = google_container_cluster.primary.name
  node_count = 1 

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

      oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]  
  }
}
