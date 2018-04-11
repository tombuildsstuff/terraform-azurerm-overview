variable "location" {
  description = "The Azure Region in which the Virtual Machines should be created"
}

variable "prefix" {
  description = "The Prefix to use for the resources in this Virtual Machine"
}

variable "tags" {
  description = "Any tags to be attached to the resources in this network"
  type        = "map"
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the Subnet in which the Virtual Machines should be created"
}

variable "number_of_instances" {
  description = "The number of Virtual Machines which should be created"
}

variable "admin_password" {
  description = "The password of the local administrator to use on the Virtual Machine"
}

variable "admin_username" {
  description = "The username of the local administrator to use on the Virtual Machine"
}
