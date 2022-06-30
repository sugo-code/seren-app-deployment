resource "azurerm_storage_container" "sugocode-storage-container" {
  name                  = "sugocode-storage-container"
  storage_account_name  = azurerm_storage_account.sugocode-storage-account.name
}

resource "azurerm_storage_blob" "sugocode-blob-storage" {
  name                   = "sugocode-blob-storage"
  storage_account_name   = azurerm_storage_account.sugocode-storage-account.name
  storage_container_name = azurerm_storage_container.sugocode-storage-container.name
  type                   = "Block"
}