resource "azurerm_cosmosdb_account" "sugocode-cosmosdb-account-table" {
  name                = "sugocode-cosmosdb-account-table"
  location            = "West US"
  resource_group_name = azurerm_resource_group.resource-group.name
  offer_type          = "Standard"

  capabilities {
    name = "EnableTable"
  }

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

resource "azurerm_cosmosdb_table" "sugocode-table" {
  name                = "sugocode-db-table"
  resource_group_name = azurerm_cosmosdb_account.sugocode-cosmosdb-account-table.resource_group_name
  account_name        = azurerm_cosmosdb_account.sugocode-cosmosdb-account-table.name
  throughput          = 400
}