variable "workspace_name" {
  description = "Name of the Databricks Workspace."
  type        = string
}

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

variable "dbx-sku" {
  description = "SKU type of Databricks Workspace."
  type        = string
}
