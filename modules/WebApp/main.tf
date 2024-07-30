data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
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
    value = "Server=tcp:${var.sql_server_name}.privatelink.database.windows.net,1433;Initial Catalog=${var.sql_database_name};Persist Security Info=False;User ID=${var.sql_server_admin_login};Password=${var.sql_server_admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }

  site_config {
    minimum_tls_version = "1.2"
  }

}
