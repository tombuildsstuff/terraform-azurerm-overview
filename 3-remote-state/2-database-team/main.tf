data "terraform_remote_state" "network" {
  backend = "azurerm"

  config {
    # NOTE: these can also come from environment variables
    storage_account_name = ""
    container_name       = "terraform"
    resource_group_name  = ""
    access_key           = ""
    key                  = "production.terraform.tfstate"
  }
}

data "azurerm_resource_group" "network" {
  name = "${data.terraform_remote_state.network.resource_group_name}"
}

data "azurerm_subnet" "database" {
  name                 = "${data.terraform_remote_state.network.database_subnet_name}"
  virtual_network_name = "${data.terraform_remote_state.network.network_name}"
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
