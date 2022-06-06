variable "project_id" {
  default = "gaussb-base"
}

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
  default = "p-envoy-01"
  type    = string
}

variable "service_account_email" {
  default = "terraform-service-account@gaussb-base.iam.gserviceaccount.com"
}

variable "boot_image" {
  default = "ubuntu-1804-lts"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "envoy_public_key" {}

variable "envoy_private_key" {}