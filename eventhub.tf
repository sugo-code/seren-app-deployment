resource "azurerm_eventhub_namespace" "sugocode-hub-ns" {
  name                = "sugocode-hub-ns"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  sku                 = "Basic"
}

resource "azurerm_eventhub" "sugocode-hub" {
  name                = "sugocode-hub"
  resource_group_name = azurerm_resource_group.resource-group.name
  namespace_name      = azurerm_eventhub_namespace.sugocode-hub-ns.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_authorization_rule" "sugocode-hub-rule" {
  resource_group_name = azurerm_resource_group.resource-group.name
  namespace_name      = azurerm_eventhub_namespace.sugocode-hub-ns.name
  eventhub_name       = azurerm_eventhub.sugocode-hub.name
  name                = "acctest"
  listen              = true
  send                = true
}