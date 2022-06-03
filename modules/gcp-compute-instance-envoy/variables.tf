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
  default = "reimbursement-envoy-instance"
  type = string
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


