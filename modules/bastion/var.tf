variable "pip_bastion_name" {
  description = "The bastion public IP name"
  type        = string
}

variable "location" {
  description = "The location for the deployment"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}


variable "bastion_name" {
  description = "The bastion name"
  type        = string
}

variable "ip_config_name" {
  description = "The bastion IP config name"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "The resource tag"
}
