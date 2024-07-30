variable "peering_name" {
  type        = string
  description = "The vnet peering name"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "vnet_name" {
  type        = string
  description = "The virtual network name"
}

variable "remote_vnet_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network for peering."
}
