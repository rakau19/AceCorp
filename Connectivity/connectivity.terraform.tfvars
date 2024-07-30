#Provider values
client_id = ""

tenant_id = ""

client_secret = ""

cnct_subscription_id = ""



#Resource Group values
resource_group_name = "rg-ace-cnct-cus-01"
location            = "centralus"

tags = {
  environment = "cnct"
  value       = "ace"
}


#Vnet Module values
vnet_name = "vnet-ace-cnct-cus-01"

address_space = ["10.14.0.0/23"]

subnets = {
  AzureFirewallSubnet = {
    name                = "AzureFirewallSubnet"
    resource_group_name = "rg-ace-cnct-cus-01"
    vnet_name           = "centralus"
    address_prefixes    = ["10.14.1.64/26"]
  },

  AzureBastionSubnet = {
    name                = "AzureBastionSubnet"
    resource_group_name = "rg-ace-cnct-cus-01"
    vnet_name           = "centralus"
    address_prefixes    = ["10.14.1.128/26"]
  },

  GatewaySubnet = {
    name                = "GatewaySubnet"
    resource_group_name = "rg-ace-cnct-cus-01"
    vnet_name           = "centralus"
    address_prefixes    = ["10.14.0.0/24"]
  },

  AppGW = {
    name                = "snet-ace-appgw-cnct-cus-01"
    resource_group_name = "rg-ace-cnct-cus-01"
    vnet_name           = "centralus"
    address_prefixes    = ["10.14.1.192/26"]
  }
}


#Bastion Module values
bastion_name = "bas-ace-cus-01"

ip_config_name = "bas-ace-cus-01-ipconfig"

pip_bastion_name = "pip-bas-ace-cus-01"


#Application Gateway Module values
appgw_subnet = "snet-ace-appgw-cnct-cus-01"

pip_appgw_name = "pip-ace-appgw-cus-01"

appgw_name = "appgw-ace-cnct-cus-01"

ip_gw_config = "appgw-ace-cus-01-ipconfig"

ssl_certificate_name_kv = "kv-appgw-cert-cnct-cus-01"

fqdns_name = [
  "webapp-ace-prod-cus-01.azurewebsites.net"
]


#Firewall Module values
firewall_name = "fw-ace-cnct-cus-01"

pip_fw_name = "pip-fw-ace-cnct-cus-01"


#Route table Module values
route_tables = {
  rt-snet-appgw-cnct-cus-01 = {
    name                   = "rt-snet-appgw-cnct-cus-01"
    route_name             = "to-vnet-ace-prod-cus-01"
    address_prefix         = "10.14.1.192/26"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = ""

  }
}


#Vnet peering module values
peering_name = "vnet-ace-cnct-cus-01--to--vnet-ace-prod-cus-01"

remote_vnet_id = "/subscriptions/5cde51f3-5a32-4bdb-a1a1-e885b5d86eb9/resourceGroups/rg-ace-prod-cus-01/providers/Microsoft.Network/virtualNetworks/vnet-ace-prod-cus-01"

