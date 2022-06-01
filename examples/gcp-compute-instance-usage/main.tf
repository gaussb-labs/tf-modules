module "gcp-compute-instance" {
  source                = "../../modules/gcp-compute-instance"
  boot_image            = var.boot_image
  instance_name         = var.instance_name
  machine_type          = var.machine_type
  network_ip            = var.network_ip
  network_tier          = var.network_tier
  project_id            = var.project_id
  service_account_email = var.service_account_email
  subnetwork_name       = var.subnetwork_name
}

module "firewall-rules" {
  source        = "../../modules/firewall-rules"
  firewall_name = var.firewall_name
  network_name  = var.network_name
  ports         = var.ports
  protocol      = var.protocol
  target_tags   = var.target_tags
}