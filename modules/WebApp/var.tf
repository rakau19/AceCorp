variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "app_plan_name" {
  type        = string
  description = "The app service plan name"
}

variable "webapp_name" {
  type        = string
  description = "The web application name"
}

variable "tags" {
  type        = map(string)
  description = "The map of resource tags"
}

#Added
variable "sql_server_name" {
  type        = string
  description = "The SQL Server name"
}

variable "sql_database_name" {
  type        = string
  description = "The SQL database name"
}

variable "sql_server_admin_login" {
  type        = string
  description = "The administrator login for the SQL server"
}

variable "sql_server_admin_password" {
  type        = string
  description = "The administrator login password for the SQL server"
}
