variable "zone_name" {
  description = "The name of the Private DNS Zone."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Private DNS Zone will be created."
  type        = string
}

variable "link_name" {
  description = "The name of the VNet link to the Private DNS Zone."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network to link to the Private DNS Zone."
  type        = string
}

variable "registration_enabled" {
  description = "Whether registration is enabled for the VNet link."
  type        = bool
  default     = false
}

variable "create_a_record" {
  description = "Whether to create an A record in the Private DNS Zone."
  type        = bool
  default     = false
}

variable "a_record_name" {
  description = "The name of the A record to create (e.g., the SQL Server name)."
  type        = string
  default     = null # Make it optional
}

variable "a_record_ttl" {
  description = "The TTL for the A record."
  type        = number
  default     = 300
}

variable "a_record_ip" {
  description = "The IP address for the A record."
  type        = string
  default     = null # Make it optional
}
