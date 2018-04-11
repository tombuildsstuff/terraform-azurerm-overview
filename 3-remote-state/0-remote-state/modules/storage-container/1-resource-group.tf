resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-state"
  location = "${var.location}"
  tags     = "${var.tags}"
}
