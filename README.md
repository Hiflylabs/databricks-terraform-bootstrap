# databricks-terraform-bootstrap

Note: a blog post about this project is available at https://hiflylabs.com/blog/2024/7/17/automated-environment-setup-best-practices-terraform-databricks-azure

## Purpose

The purpose of this repository is to provide Terraform projects that bootstraps:
- a basic production Databricks workspace with Unity Catalog enabled - **'adb-lakehouse'**

## Assumptions

- Using Microsoft Azure as cloud provider
- Have rights to create Azure resources

## Prerequisites

- Install Terraform CLI
  - follow these [instructions](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- Install Azure CLI 
  - follow these [instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
- Authenticate to Azure using Azure CLI
  - run 
    > az login

## Setup Instructions

- Clone the repository
  > git clone https://github.com/Hiflylabs/databricks-terraform-bootstrap.git 

- Change the working directory to the adb-lakehouse project
  > cd  databricks-terraform-bootstrap/projects/adb-lakehouse

- Use **terraform.tfvars.template** to create **terraform.tfvars** file.
  
  **_!!! make sure it is not checked into version control as it will contain sensitive information, too !!!_**

- Configure your environment in **terraform.tfvars** by uncommenting and setting a value for the variables 
  where the default values are not suitable. 

- Initialize terraform
  > cd projects/adb-lakehouse
  > terraform init

- Deploy terraform project
  > terraform apply

- Destroy environment (optional)
  > terraform destroy


## Project structure
A Terraform project can be implemented in a few files, but the goal in this project is to use a modular design to 
represent good engineering practices.

- Project (projects/) - Defines an environment from beginning to end, calling modules to avoid code repetition 
  - adb-lakehouse - builds all the resources calling all the modules in order with dependencies
- Modules (modules/)  - Repeatable code snippets
  - azure - manages Azure resource group
  - dbx-cluster - creates either auto-scaling or single-user-clusters
  - dbx-repos - imports desired repositories into the DBX workspace
  - dbx-workspace - creates a DBX workspace
  - unity-catalog-azure - creates the Azure resources necessary for the DBX workspace 
  - unity-catalog-metastore - creates the DBX account resources for the Unity metastore
  - unity-catalog-workspace-assignment - assigns a workspace to the Unity metastore

Both the projects and modules follow the following structure - note: (*) means optional.

- README.md - Good engineering practice 😉
- data.tf (*) - Contains infrastructure elements / data used by Terraform but not managed by it
- providers.tf - Contains the configurations for the necessary Terraform 
  [providers](https://developer.hashicorp.com/terraform/language/providers) to do the assigned work
- versions.tf - Specifies which Terraform [providers](https://developer.hashicorp.com/terraform/language/providers) 
  are used. Versions can be specified if needed. 
  In this case we use the latest versions.
- variables.tf - Variables used by the project or module are defined here. Note: default values are provided for all 
  non sensitive variables.
- outputs.tf - Declare what data is returned after the project or module has run
- terraform.tfvars.template - A template for creating a terraform.tfvars file that specifies the valuable values. 
  It is included for convenience.
- main.tf or project-name.tf - Includes the main logic and dependencies for creating the infrastructure
