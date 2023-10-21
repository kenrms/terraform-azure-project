variable "location" {
  description = "Azure region where resources shall be located"
  type        = string
  default     = "westus"
}

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
  default     = "kenco"
}

variable "sql_subnet_address" {
  description = "Address space for the Subnet that houses the SQL Server"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "sql_admin_login" {
  description = "Login username for SQL Server administrator"
  type        = string
  default     = "bigAdministratorMan"
}

variable "function_app_count" {
  description = "The number of Function Apps desired"
  type        = number
  default     = 0
}

variable "logic_app_count" {
  description = "The number of Logic Apps desired"
  type        = number
  default     = 0
}