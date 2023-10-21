output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "rule_ids" {
  value = azurerm_network_security_rule.nsg_rule[*].id
}