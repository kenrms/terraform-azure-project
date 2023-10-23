variable "location" {
  description = "Azure region where resources shall be located"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "sql_subnet_address" {
  description = "Address space for the Subnet that houses the SQL Server"
  type        = list(string)
}

variable "sql_admin_login" {
  description = "Login username for SQL Server administrator"
  type        = string
}

variable "function_app_count" {
  description = "The number of Function Apps desired"
  type        = number
}

variable "logic_app_count" {
  description = "The number of Logic Apps desired"
  type        = number
}