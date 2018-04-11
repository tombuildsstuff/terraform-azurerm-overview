resource "azurerm_virtual_machine" "main" {
  count                            = "${var.number_of_instances}"
  name                             = "${var.prefix}-vm${count.index}"
  location                         = "${azurerm_resource_group.backend.location}"
  resource_group_name              = "${azurerm_resource_group.backend.name}"
  network_interface_ids            = ["${element(azurerm_network_interface.primary.*.id, count.index)}"]
  vm_size                          = "Standard_F2"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-vm${count.index}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-vm${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = "${var.tags}"
}
