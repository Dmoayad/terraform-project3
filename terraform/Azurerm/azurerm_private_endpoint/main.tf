resource "azurerm_private_endpoint" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  custom_network_interface_name = "${var.name}-nic"

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = ["sqlServer"] # Fixed for Azure SQL Database
    is_manual_connection           = var.is_manual_connection
  }

  ip_configuration {
    name               = "my-sql-private-endpoint-ip-config"
    private_ip_address = "10.7.1.10"
    subresource_name   = "sqlServer" # REQUIRED
    member_name        = "sqlServer" # REQUIRED
  }

  tags = var.tags
}


# resource "azurerm_private_link_service_connection" "pe_approval" {
#   name                          = "${azurerm_private_endpoint.main.name}-connection" # Reference the PE created in this module
#   resource_group_name           = var.resource_group_name
#   private_endpoint_id           = azurerm_private_endpoint.main.id # Reference the PE created in this module
#   private_link_service_id       = var.private_connection_resource_id # This comes from the variable
#   is_manual_connection          = var.is_manual_connection
#   # request_message               = "Approved via Terraform"

# }