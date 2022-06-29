resource "azurerm_service_plan" "sugocode-svc-plan" {
  name                = "sugocode-svc-plan"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_service_plan" "sugocode-svc-plan-web" {
  name                = "sugocode-svc-plan-web"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  os_type             = "Windows"
  sku_name            = "F1"
}
