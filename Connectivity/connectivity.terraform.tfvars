#Vnet Module values
resource_group_name = "rg-ace-cnct-cus-01"
location            = "centralus"

tags = {
  environment = "cnct"
  value = "ace"
}

vnet_name           = "vnet-ace-cnct-cus-01"

address_space = ["10.14.0.0/23"]

subnets = {
  AzureFirewallSubnet = {
    name             = "AzureFirewallSubnet"
    resource_group_name = ""
    vnet_name           = ""
    address_prefixes = ["10.14.1.64/26"]
  },

  AzureBastionSubnet = {
    name             = "AzureBastionSubnet"
    resource_group_name = ""
    vnet_name           = ""
    address_prefixes = ["10.14.1.128/26"]
  },

  GatewaySubnet = {
    name             = "GatewaySubnet"
    resource_group_name = ""
    vnet_name           = ""
    address_prefixes = ["10.14.0.0/24"]
  },

  #AppGW = {
  #  name             = "snet-ace-appgw-cnct-cus-01"
  #  resource_group_name = ""
  #  vnet_name           = ""
  #  address_prefixes = ["10.14.1.192/26"]
  #}
}

#Bastion Module values
bastion_name = "bas-ace-cus-01"

ip_config_name = "bas-ace-cus-01-ipconfig"

pip_bastion_name = "pip-bas-ace-cus-01"

#Firewall Module values
#firewall_name = "fw-ace-cnct-cus-01"

#pip_fw_name = "pip-fw-ace-cnct-cus-01"

#subnet_id = {
#  "AzureFirewallSubnet" = {
#    subnet_id = "AzureFirewallSubnet"
#  }
#}

snet_appgw = "snet-ace-appgw-cnct-cus-01"
pip_appgw_name = "pip-ace-appgw-cus-01"

appgw_name = "appgw-ace-cnct-cus-01"

appgw_address_prefixes = [ "10.14.0.0/24" ]

ip_gw_config = "appgw-ace-cus-01-ipconfig"

ssl_certificate_name_kv = "kv-appgw-cert-cnct-cus-01"

fqdns_name = [
  "webapp-ace-prod-cus-01.azurewebsites.net"
]

#peering_name = "vnet-ace-cnct-cus-01--to--vnet-ace-prod-cus-01"

#remote_vnet_id = "/subscriptions/5cde51f3-5a32-4bdb-a1a1-e885b5d86eb9/resourceGroups/rg-ace-prod-cus-01/providers/Microsoft.Network/virtualNetworks/vnet-ace-prod-cus-01"
