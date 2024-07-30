terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnets" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value["name"]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnets.name
  address_prefixes     = each.value["address_prefixes"]

}
