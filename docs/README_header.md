# GitHub Repositories Factory

Code which manages configuration and life-cycle of the GitHub
repositories factory. It is designed to be used from a dedicated
API-Driven HCP Terraform workspace that would provision and manage the
configuration using Terraform code (IaC).

> Repository creation and management is facilitated through a no-code
> module. Each no-code module must be provisioned within the dedicated project
> to ensure proper variable input configuration and management.

## Permissions

### HCP Terraform Permissions

To manage resources, provide a user token from an account with appropriate permissions.
This user should have the `Manage Projects` and `Manage Workspaces` permission. Alternatively,
you can use a token from a team instead of a user token.

## Authentication

### HCP Terraform Authentication

The HCP Terraform provider requires a HCP Terraform/Terraform Enterprise API token in
order to manage resources.

There are several ways to provide the required token:

* Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate.

## Features

* Manages configuration and life-cycle of HCP Terraform resources:
  * Project
  * Variable Set
    * Variables
