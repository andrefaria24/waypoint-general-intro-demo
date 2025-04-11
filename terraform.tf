terraform {
  required_version = ">=1.10.5"

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.104.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.64.0"
    }
  }
}