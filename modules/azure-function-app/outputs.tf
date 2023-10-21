output "function_app_ids" {
  value = azurerm_windows_function_app.function_apps[*].id
}

output "function_app_names" {
  value = azurerm_windows_function_app.function_apps[*].name
}