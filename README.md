# Azure Metastore Assignment Terraform module
Terraform module for creation Azure Databricks Metastore Assignment

## Usage
This module provisions Azure Databricks Metastore Assignment.

```hcl
# Prerequisite resources

# Databricks Workspace with Premium SKU
data "azurerm_databricks_workspace" "example" {
  name                = "example-workspace"
  resource_group_name = "example-rg"
}

# Metastore 
module "unity_catalog" {
  source  = "data-platform-hq/unity-catalog/databricks"

  project               = "datahq"
  env                   = "example"
  location              = "eastus"

  providers = {
    databricks = databricks.main
  }
}

# Example usage of module for Databricks Metastore Assignment.
module "metastore_assignment" {
  source  = "data-platform-hq/metastore-assignment/databricks"
  version = "1.0.0"

  workspace_id = data.databricks_workspace.workspace_id
  metastore_id = module.unity_catalog.id

  providers = {
    databricks = databricks.main
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
