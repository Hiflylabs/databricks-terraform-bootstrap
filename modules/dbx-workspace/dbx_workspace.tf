resource "azurerm_databricks_workspace" "this" {
  name                        = "${var.workspace_name}"
  resource_group_name         = var.azure-resource-group
  location                    = var.azure-region
  sku                         = var.dbx-sku
  managed_resource_group_name = "${var.workspace_name}-workspace-rg"
  tags                        = var.tags
}
