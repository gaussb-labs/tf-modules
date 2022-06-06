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

  metadata_startup_script = "sudo adduser --disabled-password --gecos '' envoy; sudo mkdir -p /home/envoy/.ssh; sudo touch /home/envoy/.ssh/authorized_keys; sudo echo '${var.envoy_public_key}' > authorized_keys; sudo mv authorized_keys /home/envoy/.ssh; sudo chown -R envoy:envoy /home/envoy/.ssh; sudo chmod 700 /home/envoy/.ssh; sudo chmod 600 /home/envoy/.ssh/authorized_keys; sudo usermod -aG sudo envoy; echo 'envoy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers;"

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apt-transport-https gnupg2 curl lsb-release",
      "curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | sudo gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg",
      "echo a077cb587a1b622e03aa4bf2f3689de14658a9497a9af2c427bba5f4cc3c4723 /usr/share/keyrings/getenvoy-keyring.gpg | sha256sum --check",
      "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/ubuntu $(lsb_release -cs) main\" | sudo tee /etc/apt/sources.list.d/getenvoy.list",
      "sudo apt update",
      "sudo apt install -y getenvoy-envoy",
      "sudo mkdir /etc/envoy",
      "sudo chown envoy:envoy /etc/envoy",
      "sudo touch /etc/envoy/envoy.yaml",
      "sudo chown envoy:envoy /etc/envoy/envoy.yaml",
      "sudo chmod +766 /etc/envoy/envoy.yaml",
      "sudo chown envoy:envoy /etc/systemd/system/multi-user.target.wants",
      "sudo touch /etc/systemd/system/multi-user.target.wants/envoy.service",
      "sudo chmod +777 /etc/systemd/system/multi-user.target.wants/envoy.service",
    ]

    connection {
      type        = "ssh"
      user        = "envoy"
      host        = self.network_interface[0].access_config[0].nat_ip
      private_key = var.envoy_private_key
    }
  }
  provisioner "file" {
    source      = "./envoy.yaml"
    destination = "/etc/envoy/envoy.yaml"
    connection {
      type        = "ssh"
      user        = "envoy"
      host        = self.network_interface[0].access_config[0].nat_ip
      private_key = var.envoy_private_key
    }
  }
  provisioner "file" {
    source      = "./envoy.service"
    destination = "/etc/systemd/system/multi-user.target.wants/envoy.service"
    connection {
      type        = "ssh"
      user        = "envoy"
      host        = self.network_interface[0].access_config[0].nat_ip
      private_key = var.envoy_private_key
    }
  }

  service_account {
    email = var.service_account_email
    scopes = ["cloud-platform"]
  }
}