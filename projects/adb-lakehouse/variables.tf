# -----------------------------
# ---CONFIGURATION VARIABLES---
# -----------------------------

variable "create-azure-resource-group" {
  description = "Boolean flag indicating if Azure resource group need to be created and managed."
  type        = bool
  default     = false
}


# ---------------------
# ---AZURE VARIABLES---
# ---------------------

variable "azure-subscription-id" {
  description = "The Azure subscription where the resources are created."
  type        = string
  sensitive   = true
}


# Valid values are available at https://github.com/claranet/terraform-azurerm-regions/blob/master/REGIONS.md
variable "azure-region" {
  description = "The Azure region where resources are created."
  type        = string
  default     = "eastus2"
}

variable "azure-resource-group" {
  description = "Name of the Azure resource group in which the resources are created."
  type        = string
  default     = "playground"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Azure resources."
  default     = {
    "owner": "owner"
    "project": "project"
  }
}


# --------------------------
# ---DATABRICKS VARIABLES---
# --------------------------

variable "dbx-sku" {
  description = "SKU type of Databricks Workspace - ['standard', 'premium', 'trial']."
  type        = string
  default     = "premium"
}

variable "workspace_name" {
  description = "Name of the Databricks Workspace."
  type        = string
  default     = "prod"
}

variable "dbx-account-id" {
  description = "ID of the Databricks Account."
  type        = string
  sensitive   = true
}


# -----------------------------
# ---UNITY CATALOG VARIABLES---
# -----------------------------

variable "dbx-access-connector-name" {
  description = "Name of (Azure) Access Connector for Azure Databricks."
  type        = string
  default     = "access-connector"
}

# Lowercase letters and numbers (3-24).
variable "metastore-storage-account-name" {
  description = "Name of (Azure) Storage Account for Unity Metastore."
  type        = string
  default     = "unitystorage"
}

# For BlockBlobStorage and FileStorage accounts only 'Premium' is valid.
variable "metastore-storage-account-tier" {
  description = "Tier of Storage Account for Unity Metastore - ['Standard', 'Premium']."
  type        = string
  default     = "Standard"
}

variable "metastore-storage-account-replication-type" {
  description = "Replication type of Storage Account for Unity Metastore - ['LRS', 'GRS', 'RAGRS', 'ZRS', 'GZRS', 'RAGZRS']."
  type        = string
  default     = "LRS"
}

variable "metastore-storage-account-historical-namespace" {
  description = "Boolean value for Historical Namespace enablement."
  type        = bool
  default     = true
}

# Lowercase letters, numbers, and hyphens. Start with lowercase letter or number. Can't use consecutive hyphens. (3-63)
variable "metastore-storage-container-name" {
  description = "Name of Storage Container for Unity Metastore."
  type        = string
  default     = "unitymetastore"
}

variable "metastore-storage-container-access-type" {
  description = "Access Type of Storage Container for Unity Metastore - ['blob', 'container', 'private']."
  type        = string
  default     = "private"
}

variable "metastore-name" {
  description = "Name of the Unity Metastore."
  type        = string
  default     = "metastore"
}

variable "metastore-force-destroy" {
  description = "Boolean value indicating if non empty Metastore should be destroyed."
  type        = bool
  default     = true
}


# ---------------------------
# ---DBX CLUSTER VARIABLES---
# ---------------------------

variable "single-user-clusters" {
  description = "Map of cluster configurations for Single Node DEV clusters."
  type        = map(object({
    name                    = string
    username                = string
    autotermination_minutes = number
    data_security_mode      = string
  }))
  default     = {}
}

variable "autoscaling-clusters" {
  description = "Map of cluster configurations for Autoscaling PROD clusters."
  type        = map(object({
    name                    = string
    autotermination_minutes = number
    data_security_mode      = string
    min_workers             = number
    max_workers             = number
  }))
  default = {
    "cluster_1" = {
      name                    = "auto-scaling"
      autotermination_minutes = 10
      data_security_mode      = "USER_ISOLATION"
      min_workers             = 1
      max_workers             = 2
    }
  }
}


# -------------------------
# ---DBX REPOS VARIABLES---
# -------------------------

variable "git-username" {
  description = "The username for the git provider."
  type        = string
  sensitive   = true
}

# ['gitHub', 'gitHubEnterprise', 'bitbucketCloud', 'bitbucketServer', 'azureDevOpsServices', 'gitLab',
#  'gitLabEnterpriseEdition', 'awsCodeCommit']
variable "git-provider" {
  description = "The git provider."
  type        = string
  default     = "gitHub"
}

variable "git-personal-access-token" {
  description = "Personal Access Token to access git provider."
  type        = string
  sensitive   = true
}

variable "dbx-repos" {
  description = "Map of repositories to be imported into the Workspace."
  type        = map(object({
    url     = string
    branch  = string
  }))
  default = {
    "repo_1" = {
      url     = "https://github.com/Hiflylabs/databricks-terraform-bootstrap.git"
      branch  = "main"
    }
  }
}
