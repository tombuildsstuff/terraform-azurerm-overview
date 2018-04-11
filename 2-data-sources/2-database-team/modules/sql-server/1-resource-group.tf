resource "azurerm_resource_group" "sql" {
  name     = "${var.prefix}-sqlservers"
  location = "${var.location}"
  tags     = "${var.tags}"
}
