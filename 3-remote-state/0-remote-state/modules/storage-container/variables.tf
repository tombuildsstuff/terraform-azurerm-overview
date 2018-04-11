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
