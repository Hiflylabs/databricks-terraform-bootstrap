resource "databricks_cluster" "single_user" {
  for_each                = var.single-user-clusters
  cluster_name            = each.value.name
  single_user_name        = each.value.username
  spark_version           = var.databricks_spark_version
  node_type_id            = var.databricks_node_type
  autotermination_minutes = each.value.autotermination_minutes
  data_security_mode      = each.value.data_security_mode

  spark_conf = {
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
  }

  custom_tags = {
    "ResourceClass" = "SingleNode"
  }
}
