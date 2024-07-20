variable "location" {
  description = "The location for all resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "The list of subnets."
  type = list(object({
    name            = string
    address_prefixes = list(string)
  }))
}

variable "firewall_name" {
  description = "The name of the Firewall"
  type = string
}

variable "address_prefixes" {
  description = "The address prefixes"
  type = list(string)

}

variable "pip_fw_name" {
  description = "The public IP firewall name"
  type = string
}

variable "bastion_name" {
  description = "The bastion name"
  type = string
}

variable "ip_config_name" {
  description = "The bastion IP config name"
  type = string
}

variable "pip_bastion_name" {
  description = "The public IP bastion name"
  type = string
}

variable "pip_appgw_name" {
  description = "The public IP application gateway name"
  type = string
}

variable "appgw_name" {
  description = "The application gateway name"
  type = string
}

variable "ip_gw_config" {
  description = "The IP application gateway config name"
  type = string
}
