data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

#ADDED
data "azurerm_virtual_network" "vnets" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnets" {
  name                 = var.db_subnet
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnets.name
}
#########

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "sql_svr" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.admin_login
  administrator_login_password  = random_password.password.result
  public_network_access_enabled = true #ADDED
  minimum_tls_version           = "1.2"

  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_svr.id

  tags = var.tags
}

#ADDED
resource "azurerm_private_endpoint" "pe_sql" {
  name                = var.pe_sql_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = var.subnets_id

  private_service_connection {
    name                           = var.priv_srv_conn
    private_connection_resource_id = azurerm_mssql_server.sql_svr.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.dns_zone_group
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone_sql.id]
  }
}

resource "azurerm_private_dns_zone" "dns_zone_sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_to_vnet_link" {
  name                  = var.db_vnet_link
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone_sql.name
  virtual_network_id    = data.azurerm_virtual_network.vnets.id
}

resource "azurerm_private_dns_a_record" "dns_record" {
  name                = azurerm_mssql_server.sql_svr.name
  zone_name           = azurerm_private_dns_zone.dns_zone_sql.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.pe_sql.subnet_id]
}
#####################

resource "azurerm_mssql_firewall_rule" "allow_all_azure_ips" {
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.sql_svr.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
