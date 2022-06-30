resource "azurerm_mssql_server" "sugococde-db-server" {
  name                          = "sugococde-db-server"
  resource_group_name           = azurerm_resource_group.resource-group.name
  location                      = "West US"
  version                       = "12.0"
  administrator_login           = "itsuser"
  administrator_login_password  = "Sugocode1!"
  minimum_tls_version           = "1.2"
}

resource "azurerm_mssql_firewall_rule" "sugococde-db-server-firewall" {
  name             = "sugococde-db-server-firewall"
  server_id        = azurerm_mssql_server.sugococde-db-server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_mssql_database" "sugococde-db-sql" {
  name           = "sugococde-db-sql"
  server_id      = azurerm_mssql_server.sugococde-db-server.id
  sku_name       = "Basic"
# read_scale     = true
# zone_redundant = true
}

resource "azurerm_mssql_database_extended_auditing_policy" "sugococde-db-policy" {
  database_id                             = azurerm_mssql_database.sugococde-db-sql.id
  storage_endpoint                        = azurerm_storage_account.sugocode-storage-account.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.sugocode-storage-account.primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 6
}