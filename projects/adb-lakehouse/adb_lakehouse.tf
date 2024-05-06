module "azure" {
  count = var.create-azure-resource-group ? 1 : 0
  source                = "../../modules/azure"
  azure-region          = var.azure-region
  azure-resource-group  = var.azure-resource-group
}

module "dbx-workspace" {
  depends_on            = [module.azure]
  source                = "../../modules/dbx-workspace"
  workspace_name        = var.workspace_name
  azure-region          = var.azure-region
  azure-resource-group  = var.azure-resource-group
  tags                  = var.tags
  dbx-sku               = var.dbx-sku
}

module "unity-catalog-azure" {
  depends_on                                      = [module.azure]
  source                                          = "../../modules/unity-catalog-azure"
  azure-region                                    = var.azure-region
  azure-resource-group                            = var.azure-resource-group
  dbx-access-connector-name                       = var.dbx-access-connector-name
  metastore-storage-account-historical-namespace  = var.metastore-storage-account-historical-namespace
  metastore-storage-account-name                  = var.metastore-storage-account-name
  metastore-storage-account-replication-type      = var.metastore-storage-account-replication-type
  metastore-storage-account-tier                  = var.metastore-storage-account-tier
  metastore-storage-container-access-type         = var.metastore-storage-container-access-type
  metastore-storage-container-name                = var.metastore-storage-container-name
  tags                                            = var.tags
}

module "unity-catalog-metastore" {
  depends_on                        = [module.unity-catalog-azure, module.dbx-workspace]
  source                            = "../../modules/unity-catalog-metastore"
  azure-region                      = var.azure-region
  metastore-name                    = var.metastore-name
  metastore-storage-account-name    = var.metastore-storage-account-name
  metastore-storage-container-name  = var.metastore-storage-container-name
  providers = {
    databricks = databricks.workspace
  }
  dbx-access-connector-name         = var.dbx-access-connector-name
  dbx-access-connector-id           = module.unity-catalog-azure.access-connector-id
  metastore-id                      = module.unity-catalog-metastore.metastore-id
  metastore-force-destroy           = var.metastore-force-destroy
  workspace-id                      = module.dbx-workspace.workspace_id
}

module "unity-catalog-workspace-assignment" {
  depends_on    = [module.unity-catalog-metastore]
  source        = "../../modules/unity-catalog-workspace-assignment"
  metastore-id  = module.unity-catalog-metastore.metastore-id
  workspace-id  = module.dbx-workspace.workspace_id
}

module "dbx-single-user-clusters" {
  count                             = 1
  depends_on                        = [module.unity-catalog-metastore]
  source                            = "../../modules/dbx-cluster/single-user"
  single-user-clusters              = var.single-user-clusters
  databricks_spark_version          = data.databricks_spark_version.latest_lts.id
  databricks_node_type              = data.databricks_node_type.smallest.id
  providers = {
    databricks = databricks.workspace
  }
}

module "dbx-auto-scaling-clusters" {
  count                             = 1
  depends_on                        = [module.unity-catalog-metastore]
  source                            = "../../modules/dbx-cluster/auto-scaling"
  autoscaling-clusters              = var.autoscaling-clusters
  databricks_spark_version          = data.databricks_spark_version.latest_lts.id
  databricks_node_type              = data.databricks_node_type.smallest.id
  providers = {
    databricks = databricks.workspace
  }
}

module "dbx-repos" {
  depends_on                        = [module.unity-catalog-metastore]
  source                            = "../../modules/dbx-repos"
  git-personal-access-token         = var.git-personal-access-token
  git-provider                      = var.git-provider
  git-username                      = var.git-username
  dbx-repos                         = var.dbx-repos
  providers = {
    databricks = databricks.workspace
  }
}
