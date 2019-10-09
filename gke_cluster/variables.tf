variable "gke_location" {
  description = "GCP region"
}

variable "project_name" {
  description = "GCP project name"
}

variable "project_region" {
  description = "GCP project region"
}

variable "cluster_name" {
  description = "GKE cluster name"
}

variable "node_pool_name" {
  description = "Name for the GKE node pool"
}

variable "min_master_version" {
  description = "Minimum master version"
}

variable "node_count" {
  description = "The number of nodes to create in this cluster's default node pool"
}

variable "machine_type" {
  description = "Google Compute machine type"
}