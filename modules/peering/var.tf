variable "peering_name" {
  description = "The vnet peering name"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "vnet_name" {
  description = "The virtual network name"
  type        = string
}

variable "remote_vnet_id" {
  description = "The full Azure resource ID of the remote virtual network for peering."
  type        = string
}
