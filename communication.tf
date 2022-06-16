resource "azurerm_communication_service" "sugocode-communication-service" {
  name                = "sugocode-communication-service"
  resource_group_name = azurerm_resource_group.resource-group.name
  data_location       = "Europe"
}