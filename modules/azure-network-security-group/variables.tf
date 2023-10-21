variable "prefix" {
  description = "Prefix used for naming"
  type = string
}   

variable "location" {
  description = "Azure region"
  type = string 
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type = string
}

variable "rules" {
  description = "List of rules"
  type = list(object({
    description = string
    priority = number
    direction = string
    access = string
    protocol = string
    source_address_prefix = string
    source_port_range = string
    destination_address_prefix = string
    destination_port_range = string
  }))
}