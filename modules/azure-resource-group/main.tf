resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}-${var.location}"
  location = var.location
}