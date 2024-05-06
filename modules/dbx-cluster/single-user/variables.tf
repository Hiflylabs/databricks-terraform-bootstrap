variable "single-user-clusters" {
  type = map(object({
    name                    = string
    username                = string
    autotermination_minutes = number
    data_security_mode      = string
  }))
}

variable "databricks_spark_version" {
  description = "Spark version for cluster creation."
  type        = string
}

variable "databricks_node_type" {
  description = "Type for nodes in the cluster."
  type        = string
}
