resource "databricks_metastore_assignment" "this" {
  workspace_id         = var.workspace_id
  metastore_id         = var.metastore_id
  default_catalog_name = "hive_metastore"
}
