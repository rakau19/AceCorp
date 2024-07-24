output "app_service_id" {
  value = azurerm_service_plan.webapp_plan.id
}

output "sqldb_id" {
  value = azurerm_mssql_database.sql_db.id
}
