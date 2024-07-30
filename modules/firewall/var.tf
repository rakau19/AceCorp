variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "The virtual network name"
}

variable "fw_subnet" {
  type = string
  description = "The Firewall subnet"
}

variable "pip_fw_name" {
  type        = string
  description = "The public IP firewall name"
}

variable "firewall_name" {
  type        = string
  description = "The firewall name"
}

variable "subnets_id" {
  type        = string
  description = "The ID of the AzureFirewallSubnet"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}
