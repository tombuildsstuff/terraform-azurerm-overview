resource "azurerm_resource_group" "backend" {
  name     = "${var.prefix}-backend-nodes"
  location = "${var.location}"
  tags     = "${var.tags}"
}
