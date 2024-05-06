output "clusters" {
  value = databricks_cluster.single_user
  description = "Details of the created Databricks Single User Clusters."
}
