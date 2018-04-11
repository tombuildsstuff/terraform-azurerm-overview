resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.network.name}"
  location            = "${azurerm_resource_group.network.location}"
  address_space       = ["${var.virtual_network_address_space}"]
  tags                = "${var.tags}"
}
