variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "keyvault_name" {
  type        = string
  description = "The key vault name"
}

variable "tags" {
  type = map(string)
  description = "The map of resource tags"
}
