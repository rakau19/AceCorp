resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "../modules/vnet"
  location            = var.location
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

module "bastion" {
  source              = "../modules/bastion"
  bastion_name        = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_config_name      = var.ip_config_name
  pip_bastion_name    = var.pip_bastion_name
  subnet_id           = module.vnet.subnets_ids[1]
  tags                = var.tags

  depends_on = [module.vnet]
}

module "AppGW" {
  source                  = "../modules/AppGW"
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  location                = var.location
  pip_appgw_name          = var.pip_appgw_name
  appgw_name              = var.appgw_name
  ip_gw_config            = var.ip_gw_config
  snet_appgw              = var.snet_appgw
  appgw_address_prefixes  = var.appgw_address_prefixes
  ssl_certificate_name_kv = var.ssl_certificate_name_kv
  fqdns_name              = var.fqdns_name
  tags                    = var.tags

  depends_on = [module.vnet]
}
