resource "azurerm_databricks_access_connector" "access_connector" {
  name                = var.dbx-access-connector-name
  resource_group_name = var.azure-resource-group
  location            = var.azure-region
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_account" "unity_catalog" {
  name                     = var.metastore-storage-account-name
  location                 = var.azure-region
  resource_group_name      = var.azure-resource-group
  tags                     = var.tags
  account_tier             = var.metastore-storage-account-tier
  account_replication_type = var.metastore-storage-account-replication-type
  is_hns_enabled           = var.metastore-storage-account-historical-namespace
}

resource "azurerm_storage_container" "unity_catalog" {
  name                  = var.metastore-storage-container-name
  storage_account_name  = azurerm_storage_account.unity_catalog.name
  container_access_type = var.metastore-storage-container-access-type
}

resource "azurerm_role_assignment" "unity_blob_data_contributor" {
  scope                = azurerm_storage_account.unity_catalog.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.access_connector.identity[0].principal_id
}
