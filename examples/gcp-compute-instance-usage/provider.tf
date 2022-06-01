provider "google" {
  credentials = var.account_json
  project     = var.project_id
  region      = "asia-south2-b"
}