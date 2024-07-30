output "sql_server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.sql_svr.id
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_svr.name
}

output "mssql_database_id" {
  description = "The ID of the SQL Database."
  value       = azurerm_mssql_database.sql_db.id
}

output "random_password" {
  description = "The randomly generated password for the SQL Server administrator."
  value       = random_password.password.result
}

output "fully_qualified_domain_name" {
  value = azurerm_mssql_server.sql_svr.fully_qualified_domain_name
}

output "sql_db_name" {
  value = azurerm_mssql_database.sql_db.name
}

output "administrator_login" {
  value = azurerm_mssql_server.sql_svr.administrator_login
}

output "administrator_login_password" {
  value = random_password.password.result 
}
