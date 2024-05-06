variable "azure-region" {
  description = "The Azure region where resources are created."
  type        = string
}

variable "azure-resource-group" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "tags" {
  description = "Map of tags to attach to resources."
  type        = map(string)
}

variable "dbx-access-connector-name" {
  description = "Name of Access Connector for Azure Databricks."
  type        = string
}

variable "metastore-storage-account-name" {
  description = "Name of Storage Account for Unity Metastore."
  type        = string
}

variable "metastore-storage-account-tier" {
  description = "Tier of Storage Account for Unity Metastore."
  type        = string
}

variable "metastore-storage-account-replication-type" {
  description = "Replication type of Storage Account for Unity Metastore. (GRS, LRS)."
  type        = string
}

variable "metastore-storage-account-historical-namespace" {
  description = "Boolean value for Historical Namespace enablement."
  type        = bool
}

variable "metastore-storage-container-name" {
  description = "Name of Storage Container for Unity Metastore."
  type        = string
}

variable "metastore-storage-container-access-type" {
  description = "Access Type of Storage Container for Unity Metastore."
  type        = string
}
