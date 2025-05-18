output "storage_account_name" {
  description = "The name of the storage account created."
  value       = azurerm_storage_account.tfstate_backend.name
}

output "storage_account" {
  description = "The name of the storage account created."
  value       = azurerm_storage_account.tfstate_backend
}

output "container_name" {
  description = "The name of the blob container created."
  value       = azurerm_storage_container.tfstate_container.name
}
