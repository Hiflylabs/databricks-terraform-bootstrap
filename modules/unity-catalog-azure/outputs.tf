output "access-connector" {
  value       = azurerm_databricks_access_connector.access_connector
  description = "Details of the Databricks Access Connector."
}

output "access-connector-id" {
  value       = azurerm_databricks_access_connector.access_connector.id
  description = "the id of the access connector"
}

output "storage-account" {
  value       = azurerm_storage_account.unity_catalog
  description = "Details of the Azure Storage Account."
}

output "storage-container" {
  value       = azurerm_storage_container.unity_catalog
  description = "Details of the Azure Storage Container."
}

output "role-assignment" {
  value       = azurerm_role_assignment.unity_blob_data_contributor
  description = "Details of the Blob Data Contributor Role Assignment."
}
