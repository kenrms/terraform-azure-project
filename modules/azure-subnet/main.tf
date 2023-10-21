resource "azurerm_subnet" "subnets" {
  count = var.subnet_count
  name = format("subnet-%s-%03d", var.prefix, count.index + 1)
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = var.subnet_address_prefixes[count.index]
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  count = var.subnet_count
  subnet_id = azurerm_subnet.subnets[count.index].id
  network_security_group_id = var.nsg_id
}