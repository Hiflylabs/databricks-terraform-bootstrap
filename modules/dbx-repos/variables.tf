variable "git-personal-access-token" {
  description = "Personal Access Token to Github."
  type        = string
}

variable "git-username" {
  description = "Username of the Github user."
  type        = string
}

variable "git-provider" {
  description = "Name of git provider."
  type        = string
}

variable "dbx-repos" {
  description = "Map of repositories to be imported into the DEV Workspace."
  type = map(object({
    url     = string
    branch  = string
  }))
}
