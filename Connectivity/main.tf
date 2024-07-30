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
  subnets_id          = module.vnet.subnets_ids[1]
  tags                = var.tags

  depends_on = [module.vnet]
}

module "appgw" {
  source                  = "../modules/AppGW"
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  location                = var.location
  subnets_id              = module.vnet.subnets_ids[0]
  pip_appgw_name          = var.pip_appgw_name
  appgw_name              = var.appgw_name
  appgw_subnet            = var.appgw_subnet
  ip_gw_config            = var.ip_gw_config
  ssl_certificate_name_kv = var.ssl_certificate_name_kv
  fqdns_name              = var.fqdns_name
  tags                    = var.tags

  depends_on = [module.vnet]
}

module "firewall" {
  source              = "../modules/firewall"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  firewall_name       = var.firewall_name
  fw_subnet           = "AzureFirewallSubnet"
  pip_fw_name         = var.pip_fw_name
  subnets_id          = module.vnet.subnets_ids[2]
  tags                = var.tags

  depends_on = [module.vnet]
}

module "peering" {
  source              = "../modules/peering"
  peering_name        = var.peering_name
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  remote_vnet_id      = var.remote_vnet_id

  depends_on = [module.vnet]
}

module "rt_appgw" {
  source = "../modules/routetable"
  location = var.location
  resource_group_name = var.resource_group_name
  route_tables = var.route_tables
  firewall_ip = module.firewall.firewall_ip
  tags = var.tags

  depends_on = [ module.firewall ]
}

resource "azurerm_subnet_route_table_association" "appgw" {
  subnet_id      = module.vnet.subnets_ids[0]
  route_table_id = module.rt_appgw.route_table_ids[0]

  depends_on = [module.rt_appgw]
}
