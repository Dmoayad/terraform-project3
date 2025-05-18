



module "rg" {

  source = "../Azurerm/azurerm_resource_group"

  name     = "${local.prefix}-rg"
  location = local.location
}

module "vnet" {

  source = "../Azurerm/azurerm_virtual_network"

  name                = "${local.prefix}-vnet"
  location            = local.location
  resource_group_name = module.rg.resource_group.name
  address_space       = local.vnet_address_space

}

module "subnet" {

  source = "../Azurerm/azurerm_subnets"

  name                = "internal"
  vnet_name           = module.vnet.virtual_network.name
  resource_group_name = module.rg.resource_group.name
  address_prefixes    = local.subnet_address_prefixes
}

module "aks" {

  source = "../Azurerm/azurerm_aks"

  name                     = "${local.prefix}-aks"
  resource_group_name      = module.rg.resource_group.name
  location                 = local.location
  dns_prefix               = "${local.prefix}-dns"
  vnet_subnet_id           = module.subnet.subnet.id
  identity_type            = "SystemAssigned"
  node_resource_group_name = "${local.prefix}-aks"
  default_node_pool_name   = local.default_node_pool_name

}

module "sql_db" {

  source = "../Azurerm/azurerm_sql_db"

  collation           = local.sql_db.collation
  resource_group_name = module.rg.resource_group.name
  location            = module.rg.resource_group.location
  username            = local.sql_db.username
  password            = local.sql_db.password
  server_name         = "${local.prefix}-sql-server"
  server_version      = local.sql_db.server_version
  dbsize              = local.sql_db.dbsize
  zone_redundant      = local.sql_db.zone_redundant

  // Create a Database
  sql_database_name    = local.sql_db.sql_database_name
  sku_name             = local.sql_db.sku_name
  storage_account_type = local.sql_db.storage_account_type

  public_network_access_enabled = false
  private_endpoint_connection_name = module.sql_private_endpoint.private_service_connection_name
  private_endpoint_id = module.sql_private_endpoint.private_endpoint_id
}


# module "mssql_virtual_network_rule" {

#   source = "../Azurerm/azurerm_mssql_virtual_network_rule"

#   name      = "${local.prefix}-mvnr"
#   server_id = module.sql_db.sql_server.id
#   subnet_id = module.subnet.subnet.id

# }

module "sql_private_endpoint" {
  source = "../Azurerm/azurerm_private_endpoint"

  name                           = "my-sql-private-endpoint"
  resource_group_name            = module.rg.resource_group.name
  location                       = module.rg.resource_group.location
  subnet_id                      = module.subnet.subnet.id
  private_connection_resource_id = module.sql_db.sql_server.id # Use the ID of your SQL Database
  is_manual_connection           = false
}


module "sql_private_dns" {
  source = "../Azurerm/azurerm_private_dns_zone"

  zone_name            = "privatelink.database.windows.net"
  resource_group_name  = module.rg.resource_group.name
  link_name            = "sql-privatelink-link"
  virtual_network_id   = module.vnet.virtual_network.id # Link to your VNet
  registration_enabled = false                          # Usually false for Private Endpoint DNS

  create_a_record = true
  a_record_name   = module.sql_db.sql_server.name                  # Accessing SQL Server name through the sql_db module
  a_record_ip     = module.sql_private_endpoint.private_ip_address # Get the Private IP from the PE module output
  a_record_ttl    = 300
}
