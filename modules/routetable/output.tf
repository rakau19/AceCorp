output "route_table_ids" {
  value = [for rt in azurerm_route_table.route_table : rt.id]
}
