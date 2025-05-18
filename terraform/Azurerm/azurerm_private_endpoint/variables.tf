variable "name" {
  description = "The name of the Private Endpoint."
  type        = string
}

variable "location" {
  description = "The Azure region where the Private Endpoint will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Private Endpoint will be created."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the Private Endpoint will be placed."
  type        = string
}

variable "private_connection_resource_id" {
  description = "The resource ID of the Azure service to connect to (e.g., SQL Database ID)."
  type        = string
}

variable "is_manual_connection" {
  description = "Whether the connection requires manual approval."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the Private Endpoint."
  type        = map(string)
  default     = {}
}
