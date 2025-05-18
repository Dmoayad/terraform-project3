variable "resource_group_name" {
  description = "The name of the resource group to create the storage account in."
  type        = string
}

variable "location" {
  description = "The Azure location where the storage account will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique."
  type        = string
}

variable "container_name" {
  description = "The name of the blob container to store the tfstate file."
  type        = string
}

variable "storage_account_tier" {
  description = "The tier of the storage account (e.g., Standard, Premium)."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "The replication type of the storage account (e.g., LRS, GRS)."
  type        = string
  default     = "LRS"
}
