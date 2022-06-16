resource "azurerm_cosmosdb_account" "sugocode-cosmosdb-db2" {
  name                = "sugocode-cosmosdb-db2"
  location            = "West US"
  resource_group_name = azurerm_resource_group.resource-group.name
  offer_type          = "Standard"

  local_authentication_disabled = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "West US"
    failover_priority = 0
  }
}


resource "azurerm_cosmosdb_sql_database" "sugocode-account-sql" {
  name                = "sugocode-account-sql"
  resource_group_name = azurerm_cosmosdb_account.sugocode-cosmosdb-db2.resource_group_name
  account_name        = azurerm_cosmosdb_account.sugocode-cosmosdb-db2.name
  throughput          = 400
}