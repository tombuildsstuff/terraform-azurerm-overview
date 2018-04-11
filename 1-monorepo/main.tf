variable "prefix" {
  default = "tomdev"
}

variable "location" {
  default = "West Europe"
}

module "network" {
  source   = "./modules/network"
  prefix   = "${var.prefix}"
  location = "${var.location}"
}

module "sql-server" {
  source                       = "./modules/sql-server"
  prefix                       = "${var.prefix}"
  location                     = "${var.location}"
  subnet_id                    = "${module.network.database_subnet_id}"
  administrator_login          = "sqladministrator"
  administrator_login_password = "8af2ca02-87b5-4f1d-88e9-5b2607506938"

  tags = {
    "sql" = "server"
  }
}

module "backend-nodes" {
  source              = "./modules/backend-node"
  prefix              = "${var.prefix}"
  location            = "${var.location}"
  number_of_instances = 3
  subnet_id           = "${module.network.backend_subnet_id}"
  admin_username      = "awesomeadmin"
  admin_password      = "039e41ab-6b7b-4b6f-a92a-dc204c2727fc"

  # TODO: in the talk change this to use SSH auth?
}
