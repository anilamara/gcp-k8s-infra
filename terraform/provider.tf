terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project     = "amara-463104"
  region      = "southamerica-east1"
  zone        = "southamerica-east1-a"
}

