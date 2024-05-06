resource "databricks_git_credential" "ado" {
  git_username          = var.git-username
  git_provider          = var.git-provider
  personal_access_token = var.git-personal-access-token
}

resource "databricks_repo" "all" {
  for_each  = var.dbx-repos
  url       = each.value.url
  branch    = each.value.branch
}
