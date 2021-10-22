terraform {
  required_providers {
    github = {
	    source  = "integrations/github"
	    version = "4.13.0"
	  }
  }
}

# Connection to GitHub
provider "github" {
  token = var.github_token
}

resource "github_repository" "repo" {
  name                   = var.repo_name
  description            = var.repo_desc
  license_template       = var.repo_license
  gitignore_template     = var.repo_ignore
  has_issues             = var.repo_issues
  has_wiki               = var.repo_wiki
  delete_branch_on_merge = var.repo_delonmerge
}

resource "github_repository_file" "readme" {
  repository     = github_repository.repo.name
  file           = "readme.md"
  content        = "**Reminder**: Repository managed by Terraform."
  commit_message = "Add readme"
}

# resource "github_repository_collaborator" "victim" {
#   repository = github_repository.repo.name
#   username   = var.repo_member
# }

resource "github_issue_label" "issues" {
  count = length(var.issue_labels)
  
  repository  = github_repository.repo.name
  name        = var.issue_labels[count.index].name
  color       = var.issue_labels[count.index].color
  description = lookup(var.issue_labels[count.index], "description", null)
}