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
  name         = "test2"
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
  # Adding ssh key to the instance
   metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

# container registry
resource "google_container_registry" "registry" {
  project  = var.project
}

resource "google_storage_bucket_iam_member" "admin" {
  bucket = google_container_registry.registry.id
  role = "roles/storage.admin"
  member = "serviceAccount:${var.service_account}"
}