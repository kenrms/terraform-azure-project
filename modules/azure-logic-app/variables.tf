variable "prefix" {
  description = "Prefix used for naming"
  type = string
}

variable "location" {
  description = "Azure region"
  type = string
}

variable "resource_group_name" {
  description = "Name of resource group"
  type = string
}

variable "logic_app_count" {
  description = "How many Logic Apps you would like to provision"
  type = number
}