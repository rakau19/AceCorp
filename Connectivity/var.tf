variable "location" {
  type        = string
  description = "The location for all resources"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
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
  description = "The map resource tags"
}

variable "bastion_name" {
  type        = string
  description = "The bastion name"
}

variable "ip_config_name" {
  type        = string
  description = "The bastion IP config name"
}

variable "pip_bastion_name" {
  type        = string
  description = "The public IP bastion name"
}

variable "appgw_name" {
  type        = string
  description = "The application gateway name"
}

variable "appgw_subnet" {
  type = string
}

variable "pip_appgw_name" {
  type        = string
  description = "The public IP application gateway name"
}

variable "ip_gw_config" {
  type        = string
  description = "The IP application gateway config name"
}

variable "fqdns_name" {
  type        = set(string)
  description = "The fully qualified domain name"
}

variable "ssl_certificate_name_kv" {
  type        = string
  description = "The SSL certificate name in Key vault"
}

variable "firewall_name" {
  type        = string
  description = "The name of the Firewall"
}

variable "pip_fw_name" {
  type        = string
  description = "The public IP firewall name"
}

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

variable "peering_name" {
  type        = string
  description = "The vnet peering name"
}

variable "remote_vnet_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network for peering"
}
