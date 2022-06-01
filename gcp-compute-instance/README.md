# gcp_instance
  
   This module creates a Google Cloud Platform instance 

# Prerequisites

1. `terraform` binary
2. Google Cloud Platform

# Usage

   Basic usage of this module is as follows:
```
    locals {
     subnet_01 = "${var.network_name}-subnet-01"
     subnet_02 = "${var.network_name}-subnet-02"
    }

    module "compute_instance" {
    source = "https://github.com/gaussb-labs/tf-modules/tree/main/modules/gcp_instance"

    boot_image            = var.boot_image
    instance_name         = var.instance_name
    machine_type          = var.machine_type
    network_ip            = var.network_ip
    network_tier          = var.network_tier
    project_id            = var.project_id
    service_account_email = var.service_account_email
    subnetwork_name       = var.subnetwork_name

     subnets = [
        {
        subnet_name   = local.subnet_01
        subnet_ip     = "10.10.10.0/24"
        subnet_region = "us-west1"
        },
        {
        subnet_name           = local.subnet_02
        subnet_ip             = "10.10.20.0/24"
        subnet_region         = "us-west1"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        },
     ]
    }
```