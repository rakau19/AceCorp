variable "route_tables" {
  description = "Map of route tables to create"
  type = map(object({
    name                   = string
    route_name             = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "firewall_ip" {
  type        = string
  description = "Private IP address of the firewall"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}
