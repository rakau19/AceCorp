data "azurerm_subnet" "subnets" {
  name = var.subnets
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
}

resource "azurerm_public_ip" "pip_fw" {
  name                = var.pip_fw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "ip-config-AzureFirewall"
    subnet_id            = data.azurerm_subnet.subnets.id
    public_ip_address_id = azurerm_public_ip.pip_fw.id
  }

  tags = var.tags
}
