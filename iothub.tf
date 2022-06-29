resource "azurerm_storage_container" "sugocode-sc" {
  name                  = "sugocode-sc"
  storage_account_name  = azurerm_storage_account.sugocode-storage-account.name
  container_access_type = "private"
}

resource "azurerm_iothub" "sugocode-iothub" {
  name                = "sugocode-iothub"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location

  sku {
    name     = "F1"
    capacity = "1"
  }

  endpoint {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = azurerm_storage_account.sugocode-storage-account.primary_blob_connection_string
    name                       = "eventshub-endpoint"
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = azurerm_storage_container.sugocode-sc.name
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  }

  route = [
    {
      condition      = "true"
      enabled        = true
      endpoint_names = [
          "eventshub-endpoint",
        ]
      name           = "RouteToEvents"
      source         = "DeviceMessages"
    },
  ]

  cloud_to_device {
    max_delivery_count = 30
    default_ttl        = "PT1H"
    feedback {
      time_to_live       = "PT1H10M"
      max_delivery_count = 15
      lock_duration      = "PT30S"
    }
  }
}