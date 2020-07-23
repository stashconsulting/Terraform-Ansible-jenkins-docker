locals {
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Specify the GCP Provider
provider "google" {
  project     = var.project
  region      = local.region
  zone        = local.zone
}

// compute engine
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = var.machine_type
  zone         = local.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
