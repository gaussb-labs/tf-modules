resource "google_compute_firewall" "rules" {
  name    = var.firewall_name
  network = var.network_name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = var.protocol
    ports = var.ports
  }
  target_tags = var.target_tags
}