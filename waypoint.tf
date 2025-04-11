resource "hcp_waypoint_tfc_config" "demo" {
  token        = var.TFE_TOKEN
  tfc_org_name = data.tfe_organization.demo.name
}

resource "hcp_waypoint_template" "static-webapp" {
    name = "static-webapp"
    summary = "A template for static webapps"
    description = "A static webapp template that creates a GitHub repository with a GitHub Actions workflow that deploys to GitHub Pages."
    # readme_markdown_template = <<EOF
    #     # Static Webapp
    #     Your static webapp repository will be ready soon and contain a GitHub Actions workflow to package and serve the webapp on GitHub Pages!
    #     After the application is initialized in a minute or so, you can access your repository with the link below. It will contain a readme with additional information and a link to the deployed app.
    #     [GitHub code repository](https://github.com/ORG_NAME/{{.ApplicationName}})
    # EOF
    labels = [ "static", "webapp", "javascript" ]
    terraform_project_id = tfe_project.demo-waypoint.id
    terraform_no_code_module_source = "${tfe_registry_module.github_static_app.registry_name}/${tfe_registry_module.github_static_app.organization}/${tfe_registry_module.github_static_app.name}"
    terraform_no_code_module_id = "nocode-C2Kn9QonPnqi8ooj"
}

# resource "hcp_waypoint_application" "webapp" {
#     name = "mywebapp"
#     template_id = hcp_waypoint_template.static-webapp.id
# }