locals {
  function = ["alarms", "collector", "reports"]
}

resource "azurerm_service_plan" "sugocode-svc-plan-app" {
  name                = "sugocode-svc-plan-app"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "sugocode-fn" {
  for_each = toset(local.function)

  name                      = "sugocode-fn-${each.value}"
  resource_group_name       = azurerm_resource_group.resource-group.name
  location                  = azurerm_resource_group.resource-group.location
  service_plan_id           = azurerm_service_plan.sugocode-svc-plan-app.id
  storage_account_name      = azurerm_storage_account.sugocode-storage-account.name
  site_config {}
}
