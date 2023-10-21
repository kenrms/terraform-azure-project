variable "prefix" {
  description = "Prefix used for naming"
  type = string
}

variable "location" {
  description = "Azure region where virtual network should reside"
  type = string
}

variable "vnet_address_space" {
  description = "Address spaces for the virtual network"
  type = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group that this resource will live in"
  type = string
}