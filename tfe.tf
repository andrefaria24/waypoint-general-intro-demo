data "tfe_organization" "demo" {
  name  = var.TFE_ORG_NAME
}

resource "tfe_oauth_client" "github" {
  name             = "github-oauth-client"
  organization     = var.TFE_ORG_NAME
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.GH_TOKEN
  service_provider = "github"
  organization_scoped = true
}

resource "tfe_registry_module" "github_static_app" {
  organization = data.tfe_organization.demo.name
  name = "static-app-waypoint-demo"
  no_code = true

  vcs_repo {
    tags = true
    display_identifier = var.GH_STATIC_APP_REPO
    identifier         = var.GH_STATIC_APP_REPO
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}

# resource "tfe_no_code_module" "github_static_app" {
#   organization = data.tfe_organization.demo.id
#   registry_module = tfe_registry_module.github_static_app.id
# }

resource "tfe_project" "demo-waypoint" {
  organization = data.tfe_organization.demo.name
  name = "demo-waypoint"
}

resource "tfe_variable_set" "demo-waypoint" {
  name          = "Demo Waypoint Variable Set"
  description   = "Variable set used in the Waypoint demo"
  organization  = data.tfe_organization.demo.name
}

resource "tfe_project_variable_set" "demo-waypoint" {
  project_id    = tfe_project.demo-waypoint.id
  variable_set_id = tfe_variable_set.demo-waypoint.id
}

resource "tfe_variable" "destination_org" {
  key = "destination_org"
  value = var.GH_ORG_NAME
  category = "terraform"
  sensitive = false
  variable_set_id = tfe_variable_set.demo-waypoint.id
}

resource "tfe_variable" "gh_token" {
  key = "gh_token"
  value = var.GH_TOKEN
  category = "terraform"
  sensitive = true
  variable_set_id = tfe_variable_set.demo-waypoint.id
}

resource "tfe_variable" "slack_hook_url" {
  key = "slack_hook_url"
  value = ""
  category = "terraform"
  sensitive = true
  variable_set_id = tfe_variable_set.demo-waypoint.id
}

resource "tfe_variable" "template_org" {
  key = "template_org"
  value = "andrefaria24"
  category = "terraform"
  sensitive = false
  variable_set_id = tfe_variable_set.demo-waypoint.id
}

resource "tfe_variable" "template_repo" {
  key = "template_repo"
  value = "waypoint-intro-demo-static-app-template"
  category = "terraform"
  sensitive = false
  variable_set_id = tfe_variable_set.demo-waypoint.id
}