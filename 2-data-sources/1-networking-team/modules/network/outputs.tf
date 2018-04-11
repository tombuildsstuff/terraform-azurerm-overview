output "backend_subnet_name" {
  value = "${azurerm_subnet.backend.name}"
}

output "database_subnet_name" {
  value = "${azurerm_subnet.database.name}"
}

output "frontend_subnet_name" {
  value = "${azurerm_subnet.frontend.name}"
}

output "resource_group_name" {
  value = "${azurerm_resource_group.network.name}"
}

output "virtual_network_name" {
  value = "${azurerm_virtual_network.main.name}"
}
