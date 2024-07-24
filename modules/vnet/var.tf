variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "vnet_name" {
  type        = string
  description = "The virtual network name"
}

variable "address_space" {
  type        = list(string)
  description = "The address space"
}

variable "subnets" {
  description = "The map of Subnets"
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
  }))
}

variable "tags" {
  type        = map(string)
  description = "The resource tag"
}
