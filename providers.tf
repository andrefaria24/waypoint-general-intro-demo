provider "hcp" {
  project_id = var.HCP_PROJECT_ID
}

provider "tfe" {
  token = var.TFE_TOKEN
}