resource "databricks_metastore_assignment" "prod" {
  metastore_id  = var.metastore-id
  workspace_id  = var.workspace-id
}
