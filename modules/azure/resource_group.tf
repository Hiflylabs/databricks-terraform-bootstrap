resource "azurerm_resource_group" "this" {
  name     = var.azure-resource-group
  location = var.azure-region
}
