locals {


  prefix                 = "devops2-group5"
  location               = "East US"
  default_node_pool_name = "g5"

  vnet_address_space      = ["10.7.0.0/16"]
  subnet_address_prefixes = ["10.7.1.0/24"]

  sql_db = {
    username             = "group5"
    collation            = "SQL_Latin1_General_CP1_CI_AS"
    password             = "1234567890M*"
    server_version       = "12.0"
    dbsize               = 1
    zone_redundant       = false
    sql_database_name    = "${local.prefix}-db"
    sku_name             = "Basic"
    storage_account_type = "Local"
  }

}