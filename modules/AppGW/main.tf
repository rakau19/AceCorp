data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnets" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnets" {
  name                 = var.appgw_subnet
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnets.name
}

resource "azurerm_public_ip" "pip_appgw" {
  name                = var.pip_appgw_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${data.azurerm_subnet.subnets.name}-beap"
  frontend_port_name             = "${data.azurerm_subnet.subnets.name}-feport"
  frontend_ip_configuration_name = "${data.azurerm_subnet.subnets.name}-feip"
  http_setting_name              = "${data.azurerm_subnet.subnets.name}-be-htst"
  listener_name                  = "${data.azurerm_subnet.subnets.name}-httplstn"
  request_routing_rule_name      = "${data.azurerm_subnet.subnets.name}-rqrt"
  redirect_configuration_name    = "${data.azurerm_subnet.subnets.name}-rdrcfg"

}

resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.ip_gw_config
    subnet_id = var.subnets_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip_appgw.id
  }

  backend_address_pool {
    name  = local.backend_address_pool_name
    fqdns = var.fqdns_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  tags = var.tags
}
