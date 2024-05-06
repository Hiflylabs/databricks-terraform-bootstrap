resource "databricks_cluster" "shared_autoscaling" {
  for_each                = var.autoscaling-clusters
  cluster_name            = each.value.name
  spark_version           = var.databricks_spark_version
  node_type_id            = var.databricks_node_type
  autotermination_minutes = each.value.autotermination_minutes
  autoscale {
    min_workers = each.value.min_workers
    max_workers = each.value.max_workers
  }
  spark_conf = {
    "spark.databricks.io.cache.enabled" : true,
    "spark.databricks.io.cache.maxDiskUsage" : "50g",
    "spark.databricks.io.cache.maxMetaDataCache" : "1g"
  }
}
