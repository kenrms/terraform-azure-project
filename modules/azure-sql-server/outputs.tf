output "sql_server_id" {
  value = azurerm_mssql_server.sql_server.id
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name for the SQL Server"
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}

output "admin_password" {
  value = random_password.admin_pw.result
  sensitive = true
}