data "azurerm_client_config" "current" {
}

data "external" "me" {
  program = ["az", "account", "show", "--query", "user"]
}

data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}
