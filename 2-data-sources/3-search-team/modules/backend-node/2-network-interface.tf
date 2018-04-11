resource "azurerm_network_interface" "primary" {
  count                   = "${var.number_of_instances}"
  name                    = "${var.prefix}-nic${count.index}"
  location                = "${azurerm_resource_group.backend.location}"
  resource_group_name     = "${azurerm_resource_group.backend.name}"
  internal_dns_name_label = "${var.prefix}-vm${count.index}"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
  }
}
