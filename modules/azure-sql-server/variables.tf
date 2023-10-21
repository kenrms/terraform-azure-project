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

variable "admin_login" {
  description = "Login username for SQL Administrator"  
  type = string
}

variable "sql_subnet_id" {
  description = "Subnet ID for this SQL Server"
  type = number
}