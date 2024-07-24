data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}


resource "azurerm_public_ip" "pip_bastion" {
  name                = var.pip_bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = var.ip_config_name
    subnet_id            = "AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.pip_bastion.id
  }

  tags = var.tags
}
