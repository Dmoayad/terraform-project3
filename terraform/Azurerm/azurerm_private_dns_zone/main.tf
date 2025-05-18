resource "azurerm_private_dns_zone" "main" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = var.link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = var.registration_enabled
}

resource "azurerm_private_dns_a_record" "sql_a_record" {
  count               = var.create_a_record ? 1 : 0
  name                = var.a_record_name
  zone_name           = azurerm_private_dns_zone.main.name
  resource_group_name = var.resource_group_name
  ttl                 = var.a_record_ttl
  records             = [var.a_record_ip]
}
