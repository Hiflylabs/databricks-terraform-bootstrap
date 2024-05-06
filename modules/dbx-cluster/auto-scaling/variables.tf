variable "autoscaling-clusters" {
  description = "Map of cluster configurations for Autoscaling PROD clusters."
  type = map(object({
    name                    = string
    autotermination_minutes = number
    data_security_mode      = string
    min_workers             = number
    max_workers             = number
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
