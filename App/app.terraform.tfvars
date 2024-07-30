#Provider values
client_id = ""

tenant_id = ""

client_secret = ""

app_subscription_id = ""


#Resource Group values
resource_group_name = "rg-ace-prod-cus-01"
location            = "centralus"

tags = {
  environment = "prod"
  value       = "ace"
}


#Vnet module values
vnet_name = "vnet-ace-prod-cus-01"

address_space = ["10.15.0.0/24"]

subnets = {
  snet-ace-webapp-prod-cus-01 = {
    name                = "snet-ace-webapp-prod-cus-01"
    resource_group_name = ""
    vnet_name           = ""
    address_prefixes    = ["10.15.0.0/26"]
  }
  snet-ace-db-prod-cus-01 = {
    name                = "snet-ace-db-prod-cus-01"
    resource_group_name = ""
    vnet_name           = ""
    address_prefixes    = ["10.15.0.64/26"]
  }
}


#Key Vault module values
keyvault_name = "kv-ace-prod-cus-01"


#Sql Module Values
admin_login = "sqladmin01"

db_subnet = "snet-ace-db-prod-cus-01"

pe_sql_name = "pe-sql-connection-01"

priv_srv_conn = "priv-server-sql-connection-01"

dns_zone_group = "sql-dns-zone-group-01"

db_vnet_link = "webapp-db-vnet-link-01"


#WebApp module values
app_plan_name = "webapp-ace-prod-cus-01"

webapp_name = "webapp-ace-prod-cus-01"

sql_server_name = "sqlsvr-ace-prod-cus-01"

sql_db_name = "sqldb-ace-prod-cus-01"


#Vnet peering module values
peering_name = "vnet-ace-prod-cus-01--to--vnet-ace-cnct-cus-01"

remote_vnet_id = "/subscriptions/27313c6a-f397-4f3d-8f92-5a52a1d91895/resourceGroups/rg-ace-cnct-cus-01/providers/Microsoft.Network/virtualNetworks/vnet-ace-cnct-cus-01"
