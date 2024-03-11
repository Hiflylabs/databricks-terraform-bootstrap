output "azure-resource-group" {
  value       = length(module.azure) == 0 ? null : module.azure[0]
  description = ""
}

output "dbx-workspace" {
  value       = module.dbx-workspace.workspace
  description = "Details of the PROD Databricks Workspace created."
}

output "dbx-workspace-url" {
  value       = "https://${module.dbx-workspace.workspace_url}/"
  description = "URL of the DEV Databricks workspace"
}

output "azure-unity-access_connector" {
  value       = module.unity-catalog-azure.access-connector
  description = "Details of the Databricks Access Connector."
}

output "azure-unity-storage-account" {
  value       = module.unity-catalog-azure.storage-account
  description = "Details of the Azure Storage Account."
  sensitive   = true
}

output "azure-unity-storage-container" {
  value       = module.unity-catalog-azure.storage-container
  description = "Details of the Azure Storage Container."
}

output "azure-unity-role-assignment" {
  value       = module.unity-catalog-azure.role-assignment
  description = "Details of the Blob Data Contributor Role Assignment."
}

output "unity-metastore" {
  value       = module.unity-catalog-metastore.metastore
  description = "Details of the Unity Metastore created."
}

output "metastore-data-access" {
  value       = module.unity-catalog-metastore.metastore-data-access
  description = "Details of the Unity Metastore Data Access."
}

output "dbx-single-user-clusters" {
  value       = module.dbx-single-user-clusters[0]
  description = "Details of the created Databricks Single User Clusters."
}

output "dbx-auto-scaling-clusters" {
  value       = module.dbx-auto-scaling-clusters[0]
  description = "Details of the created Databricks Auto Scaling Clusters."
}

output "dbx-repos" {
  value       = module.dbx-repos.repo-details
  description = "Details of the Databricks Repos that were imported."
}
