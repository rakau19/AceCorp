output "vnet_name" {
  value = azurerm_virtual_network.vnets.name
}

output "rg_name" {
  value = data.azurerm_resource_group.rg
}

output "subnets_ids" {
  value = [for subnet in azurerm_subnet.subnets : subnet.id]
}
