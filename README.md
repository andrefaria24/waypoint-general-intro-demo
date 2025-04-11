# HCP Waypoint demo setup

## Demo Prerequisites

* **HashiCorp Cloud Platform Account**
* **GitHub Account + repository to be used for demo already created**
* **GitHub Access token**

## Demo Setup

1. Clone this repository
2. Set terraform.tfvars values required for HCP, and GitHub
3. Initialize Terraform configuration
    ```
    terraform init
    ```
4. Validate the Terraform environment and resolve any errors
    ```
    terraform validate
    ```
5. Review the terraform plan and apply changes
    ```
    terraform plan
    terraform apply
    ```
6. Manually add the developer instructions currently commented out within the waypoint.tf file due to a hcp provider bug to the template

## Demo Execution

### Use Case 1 - Waypoint template creation and usage

1. Log in to HCP and navigate to the Waypoint page. Click on the Applications option from the left navigation and then click on the Create an application button.

2. Choose the static-webapp template option. This is the template that you created in the previous tutorial. Click the Next button to continue.

3. In the Application name field under the Configure settings area, enter mywebapp and click on the Create application button to start the creation process.

HCP Waypoint begins the application initialization process and communicates with HCP Terraform to create the application infrastructure. This process takes a few minutes.

Once the process is complete, the Infrastructure status value will update, indicating that the Terraform workspace and infrastructure are set up and ready. You can click on the link under Template workspace to see the HCP Terraform workspace that HCP Waypoint created for the application.

4. The template creates a GitHub repository with GitHub Pages enabled and a GitHub Actions workflow. Click on the code repository link in the Developer instructions section.

The repository includes a .github/workflows directory for the GitHub Action workflow, an app directory that contains the source code for the webapp, and a README.md file with instructions on how to update the webapp as well as the GitHub Pages URL for the deployment. Click on the URL to preview the webapp.

5. Open the main.css stylesheet and update the background-color and color attributes in the body element to match what is below.

    ```
    body {
        background-color: #570f8a;
        margin-top: 5%;
        color: #e9cdff;
    }
    ```

6. Save the file, commit the changes, and push it to the repository.

7. Once it completes, refresh the GitHub Pages URL in your browser to check that the changes have been applied.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.5 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | = 0.104.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | = 0.64.0 |