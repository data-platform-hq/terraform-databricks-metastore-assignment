variable "metastore_id" {
  type        = string
  description = "Databricks Unity Catalog Metastore Id"
  default     = ""

  validation {
    condition     = anytrue([length(var.metastore_id) == 36,  length(var.metastore_id) == 0])
    error_message = "UUID has to be either in nnnnnnnn-nnnn-nnnn-nnnn-nnnnnnnnnnnn format or empty string"
  }
}

variable "workspace_id" {
  type        = string
  description = "Databricks Workspace Id"
  default     = ""
}
