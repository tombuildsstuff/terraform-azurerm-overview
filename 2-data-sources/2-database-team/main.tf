data "azurerm_resource_group" "network" {
  name = "${var.virtual_network_resource_group_name}"
}

data "azurerm_subnet" "database" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${data.azurerm_resource_group.network.name}"
}

module "sql-server" {
  source                       = "./modules/sql-server"
  prefix                       = "search"
  location                     = "${data.azurerm_resource_group.network.location}"
  subnet_id                    = "${data.azurerm_subnet.database.id}"
  administrator_login          = "sqladministrator"
  administrator_login_password = "8af2ca02-87b5-4f1d-88e9-5b2607506938"

  tags = {
    "sql" = "server"
  }
}
