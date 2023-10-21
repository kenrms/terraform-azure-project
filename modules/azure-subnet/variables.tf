variable "prefix" {
  description = "Prefix for naming"
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group the subnet lives in"
  type = string
}

variable "subnet_count" {
  description = "How many subnets you'd like to create"
  type = number
  default = 1
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type = list(list(string))
}

variable "virtual_network_name" {
  description = "Name of the VNet"
  type = string
}

variable "nsg_id" {
  description = "ID of the Network Security Group to associate this Subnet to"
  # type = number
}