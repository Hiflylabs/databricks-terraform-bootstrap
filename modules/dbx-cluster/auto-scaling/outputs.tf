output "clusters" {
  value = databricks_cluster.shared_autoscaling
  description = "Details of the created Databricks Auto Scaling Clusters."
}
