# Azure Metastore Assignment Terraform module
Terraform module for creation Azure Databricks Metastore Assignment

## Usage
This module provisions Azure Databricks Metastore Assignment.

```hcl
# Prerequisite resources
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "=1.14.2"
    }
  }
}

provider "databricks" {
  alias                       = "workspace"
  host                        = data.databricks_workspace.example.workspace_url
  azure_workspace_resource_id = data.databricks_workspace.example.id
}

# Databricks Workspace with Premium SKU
data "azurerm_databricks_workspace" "example" {
  name                = "example-workspace"
  resource_group_name = "example-rg"
}

# Assigning Unity Catalog Metastore to Workspace
module "metastore_assignment" {
  source  = "data-platform-hq/metastore-assignment/databricks"
  version = "~> 1.0"

  workspace_id = data.databricks_workspace.workspace_id
  metastore_id = "<metastore-uuid>"

  providers = {
    databricks = databricks.workspace
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | >= 1.14.2 |


## Providers

| Name                                                          | Version |
| ------------------------------------------------------------- | ------- |
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | 1.14.2  |

## Modules

No modules.

## Resources

| Name                                                                                                                              | Type     |
| --------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [databricks_metastore_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |


## Inputs

| Name                                                                                                                                    | Description                                                                                                               | Type           | Default | Required |
| --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_metastore_id"></a> [metastore\_id](#input\_metastore\_id)| Databricks Unity Catalog Metastore Id | `string` | " " |   no    |
| <a name="input_workspace_id"></a> [workspace_id](#input\_workspace_id)| Databricks Workspace Id | `string` | " " |   no    |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-databricks-metastore-assignment/blob/main/LICENSE)
