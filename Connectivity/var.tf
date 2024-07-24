variable "location" {
  type        = string
  description = "The location for all resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
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

variable "bastion_name" {
  description = "The bastion name"
  type        = string
}

variable "ip_config_name" {
  description = "The bastion IP config name"
  type        = string
}

variable "pip_bastion_name" {
  description = "The public IP bastion name"
  type        = string
}

variable "pip_appgw_name" {
  description = "The public IP application gateway name"
  type        = string
}

variable "snet_appgw" {
  description = "The list of sub."
  type        = string
}

variable "appgw_name" {
  description = "The application gateway name"
  type        = string
}

variable "ip_gw_config" {
  description = "The IP application gateway config name"
  type        = string
}

variable "appgw_address_prefixes" {
  description = "The address prefixes"
  type        = list(string)
}

variable "ssl_certificate_name_kv" {
  description = "The SSL certificate name in Key vault"
  type        = string
}

variable "fqdns_name" {
  description = "The fully qualified domain name"
  type        = set(string)
}
#variable "peering_name" {
#  description = "The vnet peering name"
#  type        = string
#}

#variable "remote_vnet_id" {
#  description = "The full Azure resource ID of the remote virtual network for peering."
#  type        = string
#}
