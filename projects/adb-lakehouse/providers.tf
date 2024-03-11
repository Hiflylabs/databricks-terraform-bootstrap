provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "databricks" {
  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.dbx-account-id
}

provider "databricks" {
  alias = "workspace"
  host  = module.dbx-workspace.workspace_url
}
