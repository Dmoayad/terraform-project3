output "private_endpoint_id" {
  description = "The ID of the Private Endpoint."
  value       = azurerm_private_endpoint.main.id
}

output "private_ip_address" {
  description = "The private IP address of the Private Endpoint."
  value       = azurerm_private_endpoint.main.private_service_connection[0].private_ip_address
}

output "private_service_connection_name" {
  description = "The name of the private service connection within the private endpoint."
  # You can access the attributes of the nested block like this:
  value       = azurerm_private_endpoint.main.private_service_connection[0].name
}