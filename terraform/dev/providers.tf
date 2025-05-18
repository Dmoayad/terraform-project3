terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "devops2-group5-storage-rg" # Name of the resource group created by the module
    storage_account_name = "devops2group5tfstate" # Name of the storage account created by the module
    container_name       = "devops2-group5-tfstate-container" # Name of the container created by the module
    key                  = "terraform.tfstate" # The path and name of your state file within the container
  }
}

provider "azurerm" {
  # Configuration options
  features {
  }

  subscription_id = "a7135c8f-934c-4000-b5b1-b09d6b645365"
}