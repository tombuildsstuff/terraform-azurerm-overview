variable "prefix" {
  description = "The prefix used for resources within this network"
}

variable "location" {
  description = "The Azure Region where this network should be hosted"
}

variable "tags" {
  description = "Any tags to be attached to the resources in this network"
  type        = "map"
  default     = {}
}

variable "virtual_network_address_space" {
  description = "The Address Space of the Virtual Network"
  default     = "10.0.0.0/16"
}

variable "backend_subnet_prefix" {
  description = "The Prefix of the Backend Subnet within the Virtual Network"
  default     = "10.0.2.0/24"
}

variable "database_subnet_prefix" {
  description = "The Prefix of the Database Subnet within the Virtual Network"
  default     = "10.0.1.0/24"
}

variable "frontend_subnet_prefix" {
  description = "The Prefix of the Frontend Subnet within the Virtual Network"
  default     = "10.0.3.0/24"
}
