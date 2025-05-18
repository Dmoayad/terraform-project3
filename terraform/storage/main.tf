module "storage_rg" {
  source = "../Azurerm/azurerm_resource_group"
  name = "${local.prefix}-storage-rg"
  location = local.location
}

module "storage" {
  source = "../Azurerm/azurerm_storage"

  resource_group_name    = module.storage_rg.resource_group.name
  location               = local.location
  storage_account_name   = "devops2g5tfstate" # Choose a unique name
  container_name         = "${local.prefix}-tfstate-container"
}