variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "vnet_name" {
  type        = string
  description = "The virtual network name"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sql_server_name" {
  type        = string
  description = "The SQL Server name"
}

variable "sql_db_name" {
  type        = string
  description = "The Sql Database name"
}
#####ADDED

variable "db_vnet_link" {
  type = string
  description = "The Sql Database Vnet Link"
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

variable "admin_login" {
  type = string
  description = "The SQL admin login"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}

variable "subnets_id" {
  type        = string
  description = "The ID of the SQL subnet"
}
