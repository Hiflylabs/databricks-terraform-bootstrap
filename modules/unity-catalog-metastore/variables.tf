variable "azure-region" {
  description = "The Azure region where resources are created."
  type        = string
}

variable "metastore-storage-account-name" {
  description = "Name of Storage Account for Unity Metastore."
  type        = string
}

variable "metastore-storage-container-name" {
  description = "Name of Storage Container for Unity Metastore."
  type        = string
}

variable "metastore-name" {
  description = "Name of the Unity Metastore."
  type        = string
}

variable "metastore-id" {
  description = "ID of the Unity Metastore."
  type        = string
}

variable "dbx-access-connector-name" {
  description = "Name of Access Connector for Azure Databricks."
  type        = string
}

variable "dbx-access-connector-id" {
  description = "ID of Access Connector for Azure Databricks."
  type        = string
}

variable "metastore-force-destroy" {
  description = "Boolean value indicating if non empty Metastore should be destroyed."
  type        = bool
}

variable "workspace-id" {
  description = "ID of the Databricks Workspace."
  type        = string
}
