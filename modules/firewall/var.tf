variable "location" {
  description = "The location for the deployment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  type        = string
  description = "The virtual network name"
}

variable "subnets" {
  type        = string
  description = "The subnet name"
}

variable "pip_fw_name" {
  description = "The public IP firewall name"
  type        = string
}

variable "firewall_name" {
  description = "The firewall name"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the AzureFirewallSubnet"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "The resource tag"
}
