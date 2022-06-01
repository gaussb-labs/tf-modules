resource "google_compute_instance" "compute_instance" {
  machine_type = var.machine_type
  name         = var.instance_name
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = var.network_name
    network_ip = var.network_ip
    subnetwork = var.subnetwork_name
    access_config {
      network_tier = var.network_tier
    }
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}