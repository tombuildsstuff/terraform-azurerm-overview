resource "azurerm_sql_server" "main" {
  name                         = "${var.prefix}-sqlsvr"
  resource_group_name          = "${azurerm_resource_group.sql.name}"
  location                     = "${azurerm_resource_group.sql.location}"
  version                      = "12.0"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  tags                         = "${var.tags}"
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = "${var.prefix}-sql-to-db-subnet"
  resource_group_name = "${azurerm_resource_group.sql.name}"
  server_name         = "${azurerm_sql_server.main.name}"
  subnet_id           = "${var.subnet_id}"
}
