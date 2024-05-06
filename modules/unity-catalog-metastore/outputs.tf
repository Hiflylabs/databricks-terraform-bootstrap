output "metastore" {
  value       = databricks_metastore.databricks-metastore
  description = "Details of the Unity Metastore created."
}

output "metastore-id" {
  value       = databricks_metastore.databricks-metastore.id
  description = "ID of the Unity Metastore created."
}

output "metastore-data-access" {
  value = databricks_metastore_data_access.access-connector-data-access
  description = "Details of the Unity Metastore Data Access."
}
