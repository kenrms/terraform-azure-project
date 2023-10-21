output "logic_app_ids" {
  value = azurerm_logic_app_workflow.logic_apps[*].id
}

output "logic_app_names" {
  value = azurerm_logic_app_workflow.logic_apps[*].name
}