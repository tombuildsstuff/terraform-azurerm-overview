data "azurerm_resource_group" "network" {
  name = "${var.virtual_network_resource_group_name}"
}

data "azurerm_subnet" "backend" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${data.azurerm_resource_group.network.name}"
}

module "backend-nodes" {
  source              = "./modules/backend-node"
  prefix              = "search"
  location            = "${data.azurerm_resource_group.network.location}"
  number_of_instances = 3
  subnet_id           = "${data.azurerm_subnet.backend.id}"
  admin_username      = "awesomeadmin"
  admin_password      = "039e41ab-6b7b-4b6f-a92a-dc204c2727fc"
}
