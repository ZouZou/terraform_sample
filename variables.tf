variable "github_token" {
  description = "GitHub Token"
  type        = string
  default     = ""
}
variable "repo_name" {
  description = "Repository Name"
  type        = string
  default     = ""
}
variable "repo_desc" {
  description = "Repository Description"
  type        = string
  default     = "Repository Description"
}
variable "repo_license" {
  description = "Repository License"
  type        = string
  default     = "MIT"
}
variable "repo_ignore" {
  description = "Repository Ignore"
  type        = string
  default     = ""
}
variable "repo_issues" {
  description = "Repository Issues"
  type        = bool
  default     = true
}
variable "repo_wiki" {
  description = "Repository Wiki"
  type        = bool
  default     = true
}
variable "repo_delonmerge" {
  description = "Repository Delete on Merge"
  type        = bool
  default     = true
}

variable "repo_member" {
  description = "Repository Member"
  type        = string
  default     = ""
}
variable "issue_labels" {
  description = "Label Issues"
  type        = list(object({
    name = string
    color = string
    description = string
  }))
  default     = [
      {
        name = "critical"
        color = "FF0000"
        description = "critical issue"
      }
  ]
}