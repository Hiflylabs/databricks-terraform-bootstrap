# Create Metastore
resource "databricks_metastore" "databricks-metastore" {
  name = var.metastore-name
  region = var.azure-region
  storage_root = format(
    "abfss://%s@%s.dfs.core.windows.net/",
    var.metastore-storage-container-name,
    var.metastore-storage-account-name
  )
  force_destroy = true
}

# Give access to the access connector that will be assumed by Unity Catalog to access data
resource "databricks_metastore_data_access" "access-connector-data-access" {
  depends_on   = [databricks_metastore.databricks-metastore]
  metastore_id = databricks_metastore.databricks-metastore.id
  name         = var.dbx-access-connector-name
  azure_managed_identity {
    access_connector_id = var.dbx-access-connector-id
  }
  is_default = true
}
