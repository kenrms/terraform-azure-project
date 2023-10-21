variable "prefix" {
  description = "Prefix for naming"
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

variable "function_app_count" {
  description = "How many Function Apps you would like to provision"
  type = number
}