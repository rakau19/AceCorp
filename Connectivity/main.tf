module "vnet" {
  source              = "../modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  subnets             = var.subnets

}

module "firewall" {
  source              = "../modules/firewall"
  firewall_name       = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  pip_fw_name         = var.pip_fw_name
  subnet_id           = module.vnet.subnet_ids[0]

  depends_on = [module.vnet]
}

module "bastion" {
  source              = "../modules/bastion"
  bastion_name        = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_config_name      = var.ip_config_name
  pip_bastion_name    = var.pip_bastion_name
  subnet_id           = module.vnet.subnet_ids[1]

  depends_on = [ module.vnet ]
}

module "appgw" {
  source              = "../modules/AppGW"
  resource_group_name = var.resource_group_name
  vnets               = var.vnet_name
  location            = var.location
  pip_appgw_name      = var.pip_appgw_name
  appgw_name          = var.appgw_name
  ip_gw_config        = var.ip_gw_config
  subnets             = module.vnet.subnet_ids[2]
  address_prefixes    = var.address_prefixes

  depends_on = [ module.vnet ]
}
