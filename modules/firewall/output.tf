output "firewall_id" {
  value = azurerm_firewall.firewall.id
}

output "firewall_ip" {
  value = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}
