variable "location" {
  description = "The location for the deployment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_plan_name" {
  description = "The app service plan name"
  type        = string
}

variable "webapp_name" {
  description = "The web application name"
  type        = string
}

variable "sql_server_name" {
  description = "The sql server name"
  type        = string
}

variable "sql_db_name" {
  description = "The Sql DB name"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "The resource tag"
}
