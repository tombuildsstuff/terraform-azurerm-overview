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

data "azurerm_subnet" "backend" {
  name                 = "${data.terraform_remote_state.network.backend_subnet_name}"
  virtual_network_name = "${data.terraform_remote_state.network.network_name}"
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
