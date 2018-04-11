terraform {
  backend "azurerm" {
    # NOTE: these can also come from environment variables
    storage_account_name = ""
    container_name       = "terraform"
    resource_group_name  = ""
    access_key           = ""
    key                  = "production.terraform.tfstate"
  }
}

module "network" {
  source   = "./modules/network"
  prefix   = "production"
  location = "West Europe"
}

output "resource_group_name" {
  value = "${module.network.resource_group_name}"
}

output "network_name" {
  value = "${module.network.virtual_network_name}"
}

output "backend_subnet_name" {
  value = "${module.network.backend_subnet_name}"
}

output "database_subnet_name" {
  value = "${module.network.database_subnet_name}"
}

output "frontend_subnet_name" {
  value = "${module.network.frontend_subnet_name}"
}
