variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "appgw_subnet" {
  type = string
  description = "The name of the application gateway subnet"
}

variable "subnets_id" {
  type        = string
  description = "The ID of the subnet"
}

variable "vnet_name" {
  type        = string
  description = "The vnet name"
}

variable "pip_appgw_name" {
  type        = string
  description = "The application gateway public IP name"
}

variable "appgw_name" {
  type        = string
  description = "The application gateway name"
}

variable "ip_gw_config" {
  type        = string
  description = "The application gateway IP config name"
}

variable "ssl_certificate_name_kv" {
  type        = string
  description = "The SSL certificate name in the Key vault"
}

variable "fqdns_name" {
  type        = set(string)
  description = "The fully qualified domain name"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}
