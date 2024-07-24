resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_service_plan" "webapp_plan" {
  name                = var.app_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "B1"
  os_type             = "Windows"

  tags = var.tags
}

resource "azurerm_windows_web_app" "Ace_Corp" {
  name                = var.webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.webapp_plan.id

  tags = var.tags

  connection_string {
    name  = "SqlAzureconnectionstring"
    type  = "SQLAzure"
    value = "Server=tcp:${azurerm_mssql_server.sql_svr.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.sql_db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.sql_svr.administrator_login};Password=${azurerm_mssql_server.sql_svr.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }

  site_config {
    minimum_tls_version = "1.2"
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_mssql_server" "sql_svr" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin01"
  administrator_login_password = random_password.password.result

  tags = var.tags

}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_svr.id

  tags = var.tags

}

resource "azurerm_mssql_firewall_rule" "allow_all_azure_ips" {
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.sql_svr.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

