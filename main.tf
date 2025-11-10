# The following code block is used to create and manage the project where all the workspaces related to the repositories will be stored.

resource "tfe_project" "this" {
  count        = var.project_name != null ? 1 : 0
  name         = var.project_name
  organization = var.organization_name
  description  = var.project_description
  tags = merge(var.project_tags, {
    managed_by_terraform = "true"
  })
}

# The following code block is used to create and manage the variable set at the project level that will own the variables required by the child workspaces.

# NOTE: How can we configure the scope

resource "tfe_variable_set" "this" {
  count             = length(tfe_project.this) > 0 ? 1 : 0
  name              = lower(replace("${tfe_project.this[0].name}-hcp", "/\\W|_|\\s/", "-"))
  description       = "Variable set for project \"${tfe_project.this[0].name}\"."
  organization      = var.organization_name
  parent_project_id = tfe_project.this[0].id
}

# The following resource blocks are used to create variables that will be stored into the variable set previously created.

resource "tfe_variable" "github_app_id" {
  count           = length(tfe_variable_set.this) > 0 ? 1 : 0
  key             = "GITHUB_APP_ID"
  value           = var.github_app_id
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.this[0].id
}

resource "tfe_variable" "github_app_installation_id" {
  count           = length(tfe_variable_set.this) > 0 ? 1 : 0
  key             = "GITHUB_APP_INSTALLATION_ID"
  value           = var.github_app_installation_id
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.this[0].id
}

resource "tfe_variable" "github_app_pem_file" {
  count           = length(tfe_variable_set.this) > 0 ? 1 : 0
  key             = "GITHUB_APP_PEM_FILE"
  value           = var.github_app_pem_file
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.this[0].id
}

resource "tfe_variable" "github_owner" {
  count           = length(tfe_variable_set.this) > 0 ? 1 : 0
  key             = "GITHUB_OWNER"
  value           = var.github_owner
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.this[0].id
}
