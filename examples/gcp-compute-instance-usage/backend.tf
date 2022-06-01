terraform {
  backend "gcs" {
    bucket = "terraform-iaac"
    prefix = "terraform/state"
  }
}
