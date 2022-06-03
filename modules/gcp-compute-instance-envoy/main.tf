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
    network = var.network_name
    access_config {

    }
  }

  metadata_startup_script = "sudo apt update;sudo apt install apt-transport-https gnupg2 curl lsb-release;curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | sudo gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg;echo a077cb587a1b622e03aa4bf2f3689de14658a9497a9af2c427bba5f4cc3c4723 /usr/share/keyrings/getenvoy-keyring.gpg | sha256sum --check;echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/ubuntu $(lsb_release -cs) main\" | sudo tee /etc/apt/sources.list.d/getenvoy.list;sudo apt update;sudo apt install -y getenvoy-envoy;"

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}