output "peering_name_id" {
  value = azurerm_virtual_network_peering.peering.id
}

output "rg_name" {
  value = data.azurerm_resource_group.rg
}
