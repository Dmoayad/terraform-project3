resource "azurerm_storage_account" "tfstate_backend" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = "StorageV2" # Recommended for most use cases
  is_hns_enabled           = true        # Recommended for ADLS Gen2

#   tags = {
#     environment = "terraform-backend"
#   }
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.container_name
  storage_account_id  = azurerm_storage_account.tfstate_backend.id
  container_access_type = "private" # Ensure the container is not publicly accessible
}
