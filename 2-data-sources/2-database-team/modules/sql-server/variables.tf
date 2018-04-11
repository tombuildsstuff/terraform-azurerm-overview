variable "prefix" {
  description = "The prefix used for resources associated with the SQL Server"
}

variable "location" {
  description = "The Azure Region where the SQL Server should be hosted"
}

variable "tags" {
  description = "Any tags to be attached to the resources associated with the SQL Server"
  type        = "map"
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the Subnet which the SQL Server should be linked to"
}

variable "administrator_login" {
  description = "The Username of the SQL Administrator for this SQL Server"
}

variable "administrator_login_password" {
  description = "The Password associated with the SQL Administrator for this SQL Server"
}
