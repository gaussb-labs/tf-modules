variable "project_id" {}

variable "zone" {
  type    = string
  default = "asia-south2-b"
}

variable "tags" {
  type    = list(string)
  default = ["ssh"]
}

variable "network_name" {
  type    = string
  default = "default"
}

variable "instance_name" {
  type = string
}

variable "service_account_email" {}

variable "boot_image" {}

variable "machine_type" {}

variable "subnetwork_name" {}

variable "network_ip" {}

variable "network_tier" {}
