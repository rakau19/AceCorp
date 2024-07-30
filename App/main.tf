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

module "keyvault" {
  source              = "../modules/keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  keyvault_name       = var.keyvault_name
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

module "sql" {
  source              = "../modules/sqldb"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  subnets_id          = module.vnet.subnets_ids[1]
  db_subnet           = var.db_subnet
  admin_login         = var.admin_login
  sql_server_name     = var.sql_server_name
  sql_db_name         = var.sql_db_name
  pe_sql_name         = var.pe_sql_name
  db_vnet_link        = var.db_vnet_link
  dns_zone_group      = var.dns_zone_group
  priv_srv_conn       = var.priv_srv_conn
  tags                = var.tags

  depends_on = [module.vnet]
}

module "webapp" {
  source                    = "../modules/WebApp"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_plan_name             = var.app_plan_name
  webapp_name               = var.webapp_name
  sql_server_name           = module.sql.sql_server_name
  sql_database_name         = module.sql.sql_db_name
  sql_server_admin_login    = module.sql.administrator_login
  sql_server_admin_password = module.sql.administrator_login_password
  tags                      = var.tags

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
