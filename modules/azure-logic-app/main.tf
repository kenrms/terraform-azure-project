resource "azurerm_logic_app_workflow" "logic_apps" {
  count = var.logic_app_count
  name = "logic-app-${var.prefix}-${var.location}-${format("%03d", count.index + 1)}"
  location = var.location
  resource_group_name = var.resource_group_name
}

