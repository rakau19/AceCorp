variable "location" {
  description = "The location for the deployment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "snet_appgw" {
  description = "The list of sub."
  type        = string
}

variable "vnet_name" {
  description = "The vnet name"
  type        = string
}

variable "pip_appgw_name" {
  description = "The application gateway public IP name"
  type        = string
}

variable "appgw_name" {
  description = "The application gateway name"
  type        = string
}

variable "appgw_address_prefixes" {
  description = "The address prefix"
  type        = list(string)
}

variable "ip_gw_config" {
  description = "The application gateway IP config name"
  type        = string
}

variable "ssl_certificate_name_kv" {
  description = "The SSL certificate name in the Key vault"
  type        = string
}

variable "fqdns_name" {
  description = "The fully qualified domain name"
  type        = set(string)
}

variable "tags" {
  type        = map(string)
  description = "The resource tag"
}
