resource "azurerm_network_security_group" "nsg" {
  name = "nsg-${var.prefix}-${var.location}"
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "nsg_rule" {
  count = length(var.rules)
  name = "${azurerm_network_security_group.nsg.name}-rule-${format("%03d", count.index + 1)}"
  description = var.rules[count.index].description
  priority = var.rules[count.index].priority
  direction = var.rules[count.index].direction
  access = var.rules[count.index].access
  protocol = var.rules[count.index].protocol
  source_address_prefix = var.rules[count.index].source_address_prefix
  source_port_range = var.rules[count.index].source_port_range
  destination_address_prefix = var.rules[count.index].destination_address_prefix
  destination_port_range = var.rules[count.index].destination_port_range

  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name = var.resource_group_name
}