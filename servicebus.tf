resource "azurerm_servicebus_namespace" "sugocode-servicebus-ns" {
  name                = "sugocode-servicebus-ns"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  sku                 = "Basic"
}

resource "azurerm_servicebus_queue" "sugocode-servicebus-queue" {
  name                = "sugocode-servicebus-queue"
  namespace_id        = azurerm_servicebus_namespace.sugocode-servicebus-ns.id
  max_delivery_count  = 400
}

resource "azurerm_servicebus_queue" "sugocode-servicebus-alert" {
  name                = "sugocode-servicebus-alert"
  namespace_id        = azurerm_servicebus_namespace.sugocode-servicebus-ns.id
}
