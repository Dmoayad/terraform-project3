resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.username
  administrator_login_password = var.password

  public_network_access_enabled = var.public_network_access_enabled
}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  license_type = var.license_type
  max_size_gb = var.dbsize
  sku_name = var.sku_name
  collation = var.collation
  zone_redundant = var.zone_redundant
  storage_account_type = var.storage_account_type
}


# resource "azurerm_private_endpoint_connection" "pe_approval" {
#   # The name here needs to match the name of the private service connection
#   # within your azurerm_private_endpoint resource.
#   name                = var.private_endpoint_connection_name # Use a variable for the connection name
#   resource_group_name = azurerm_mssql_server.sql_sever.resource_group_name # Use the SQL Server's RG
#   private_endpoint_id = var.private_endpoint_id # Needs to receive the PE ID as a variable

#   private_link_service_connection_state {
#     status      = "Approved"
#     description = "Approved via Terraform"
#   }

#   # Ensure this resource depends on the private endpoint being created
#   # Since the PE ID is a variable, Terraform will infer this dependency
#   # You could add an explicit depends_on if needed, but often not necessary
#   # depends_on = [ var.private_endpoint_id ] # Example explicit dependency
# }