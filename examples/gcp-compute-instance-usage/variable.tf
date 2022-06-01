variable "boot_image" {}

variable "instance_name" {}

variable "machine_type" {}

variable "network_ip" {}

variable "network_tier" {}

variable "project_id" {}

variable "service_account_email" {}

variable "subnetwork_name" {}

variable "account_json" {}

variable "firewall_name" {}

variable "network_name" {}

variable "ports" {
  type = list(string)
}

variable "protocol" {
  type = string
}

variable "target_tags" {
  type = list(string)
}