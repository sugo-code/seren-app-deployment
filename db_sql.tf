resource "azurerm_cosmosdb_account" "sugocode-cosmosdb-account-sql" {
  name                = "sugocode-cosmosdb-account-sql"
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

resource "azurerm_cosmosdb_sql_database" "sugocode-db-sql" {
  name                = "sugocode-db-sql"
  resource_group_name = azurerm_cosmosdb_account.sugocode-cosmosdb-account-sql.resource_group_name
  account_name        = azurerm_cosmosdb_account.sugocode-cosmosdb-account-sql.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "sugocode-db-sql-container" {
  name                  = "example-container"
  resource_group_name   = azurerm_cosmosdb_account.sugocode-cosmosdb-account-sql.resource_group_name
  account_name          = azurerm_cosmosdb_account.sugocode-cosmosdb-account-sql.name
  database_name         = azurerm_cosmosdb_sql_database.sugocode-db-sql.name
  partition_key_path    = "/definition/id"
  partition_key_version = 1
  throughput            = 400

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}