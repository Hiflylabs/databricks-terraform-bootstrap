# Azure Resource Group Creation

This module includes setup for the following resources:
* Azure resource group

## How to use it
1. Reference this module using one of the different [module source types](https://developer.hashicorp.com/terraform/language/modules/sources)
2. Add a `variables.tf` with the same content in [variables.tf](variables.tf)
3. Add a `terraform.tfvars` file and provide values to each defined variable
4. (Optional) Configure your [remote backend](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)
5. Run `terraform init` to initialize terraform and get provider ready.
6. Run `terraform apply` to create the resources.
