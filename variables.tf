variable "github_app_id" {
  description = "(Required) The GitHub App ID used to authenticate to GitHub."
  type        = string
  nullable    = false
}

variable "github_app_installation_id" {
  description = "(Required) The GitHub App Installation ID used to authenticate to GitHub."
  type        = string
  nullable    = false
}

variable "github_app_pem_file" {
  description = "(Required) The GitHub App PEM file used to authenticate to GitHub."
  type        = string
  nullable    = false
}

variable "github_owner" {
  description = "(Required) The GitHub owner (user or organization) of the repositories."
  type        = string
  nullable    = false
}

variable "organization_name" {
  description = "(Required) Name of the organization."
  type        = string
  nullable    = false
}

variable "project_description" {
  description = "(Optional) A description for the project."
  type        = string
  nullable    = true
  default     = null
}

variable "project_name" {
  description = "(Optional) Name of the project."
  type        = string
  nullable    = true
  default     = "GitHub Repositories Factory"
}

variable "project_tags" {
  description = "(Optional) A map of key-value tags to add to the project."
  type        = map(string)
  nullable    = true
  default     = null
}
