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
  description = "The name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network"
}

variable "subnets" {
  description = "The list of subnets."
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
  }))
}

variable "keyvault_name" {
  type        = string
  description = "The key vault name"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}

variable "app_plan_name" {
  type        = string
  description = "The app service plan name"
}

variable "webapp_name" {
  type        = string
  description = "The web application name"
}

variable "sql_server_name" {
  type        = string
  description = "The Sql server name"
}

variable "sql_db_name" {
  type        = string
  description = "The Sql Database name"
}

variable "admin_login" {
  type = string
  description = "The SQL admin login"
}

variable "db_subnet" {
  type = string
  description = "The Sql Database subnet"
}

variable "pe_sql_name" {
  type = string
  description = "The private endpoint for SQL"
}

variable "priv_srv_conn" {
  type = string
  description = "The private service connection"
}

variable "dns_zone_group" {
  type = string
  description = "The DNS zone group"
}

variable "db_vnet_link" {
  type = string
  description = "The Sql Database Vnet Link"
}

variable "peering_name" {
  type        = string
  description = "The vnet peering name"
}

variable "remote_vnet_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network for peering"
}
