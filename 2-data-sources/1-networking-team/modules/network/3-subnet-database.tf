resource "azurerm_network_security_group" "database" {
  name                = "${var.prefix}-dbnsg"
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "database" {
  name                      = "database"
  resource_group_name       = "${azurerm_resource_group.network.name}"
  virtual_network_name      = "${azurerm_virtual_network.main.name}"
  address_prefix            = "${var.database_subnet_prefix}"
  network_security_group_id = "${azurerm_network_security_group.database.id}"
  service_endpoints         = ["Microsoft.Sql"]
}

resource "azurerm_network_security_rule" "database-mssql-inbound" {
  name                        = "allow-mssql-inbound-from-backend"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "${var.backend_subnet_prefix}"
  destination_address_prefix  = "${var.database_subnet_prefix}"
  resource_group_name         = "${azurerm_resource_group.network.name}"
  network_security_group_name = "${azurerm_network_security_group.database.name}"
}
