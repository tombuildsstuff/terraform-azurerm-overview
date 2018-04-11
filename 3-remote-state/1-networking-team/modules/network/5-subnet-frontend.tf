resource "azurerm_network_security_group" "frontend" {
  name                = "${var.prefix}-fensg"
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "frontend" {
  name                      = "frontend"
  resource_group_name       = "${azurerm_resource_group.network.name}"
  virtual_network_name      = "${azurerm_virtual_network.main.name}"
  address_prefix            = "${var.frontend_subnet_prefix}"
  network_security_group_id = "${azurerm_network_security_group.frontend.id}"
}

resource "azurerm_network_security_rule" "https-to-frontend" {
  name                        = "allow-https-to-frontend"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "${var.frontend_subnet_prefix}"
  destination_address_prefix  = "${var.backend_subnet_prefix}"
  resource_group_name         = "${azurerm_resource_group.network.name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}
