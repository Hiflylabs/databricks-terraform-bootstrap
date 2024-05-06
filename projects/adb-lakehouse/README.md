# Azure Databricks Lakehouse for a PROD environment

This code includes the complete setup for a PROD environment.

The following resources are created and managed:
* Azure Resource Group
* Databricks Workspace
* Resources for Unity Metastore
  * Azure Resources
    * Access Connector for Azure Databricks
    * Storage Account
    * Storage Container
    * Blob Data Contributor Role Assignment
  * Databricks Resources
    * Metastore
    * Metastore Data Access
    * Metastore-Workspace Assignment
* Databricks Clusters
  * Single User (Single Node)
  * Auto Scaling
* Databricks Repos

## How to use

1. Update `terraform.tfvars` file and provide values to each defined variable
2. (Optional) Configure your [remote backend](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)
3. Run `terraform init` to initialize terraform and get provider ready.
4. Run `terraform apply` to create the resources.
