resource "azurerm_service_plan" "sugocode-svc-plan" {
  name                = "sugocode-svc-plan"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  os_type             = "Linux"
  sku_name            = "Y1"
}
