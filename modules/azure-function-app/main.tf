resource "azurerm_storage_account" "storage_accounts" {
  count                    = var.function_app_count
  name                     = "sa${var.prefix}${var.location}${format("%02d", count.index + 1)}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
}

resource "azurerm_service_plan" "service_plans" {
  count               = var.function_app_count
  name                = "plan-${var.prefix}-${var.location}-${format("%02d", count.index + 1)}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "function_apps" {
  count               = var.function_app_count
  name                = "func-${var.prefix}-${var.location}-${format("%02d", count.index + 1)}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = azurerm_storage_account.storage_accounts[count.index].name
  storage_account_access_key = azurerm_storage_account.storage_accounts[count.index].primary_access_key
  service_plan_id            = azurerm_service_plan.service_plans[count.index].id

  site_config {}
}