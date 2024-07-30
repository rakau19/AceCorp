data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_route_table" "route_table" {
  for_each = var.route_tables
  name                = each.value.name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  route {
    name                   = each.value.route_name
    address_prefix         = each.value.address_prefix
    next_hop_type          = each.value.next_hop_type
    next_hop_in_ip_address = each.value.next_hop_in_ip_address != "" ? each.value.next_hop_in_ip_address : var.firewall_ip
  }
  
  tags = var.tags
}

resource "null_resource" "previous" {}

resource "time_sleep" "wait_1_minutes" {
  depends_on = [null_resource.previous]

  create_duration = "1m"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_1_minutes]
}
