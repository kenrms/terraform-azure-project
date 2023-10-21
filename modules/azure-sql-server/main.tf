resource "random_password" "admin_pw" {
    length = 16
    special = true
}

resource "azurerm_mssql_server" "sql_server" {
    name = "sql-${var.prefix}-${var.location}"
    resource_group_name = var.resource_group_name
    location = var.location
    version = "12.0"
    administrator_login = var.admin_login
    administrator_login_password = random_password.admin_pw.result
}

resource "azurerm_mssql_virtual_network_rule" "sql_vnet_rule" {
  name = "${azurerm_mssql_server.sql_server.name}-vnet-rule"
  server_id = azurerm_mssql_server.sql_server.id
  subnet_id = var.sql_subnet_id
}