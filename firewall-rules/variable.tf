variable "firewall_name" {
  type  = string
}

variable "network_name" {
  type = string
}

variable "protocol" {
  type = string
}

variable "ports" {
  type = list(string)
}

variable "target_tags" {
  type = list(string)
}