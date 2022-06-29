resource "azurerm_linux_function_app" "sugocode-fn-collector" {
  name                = "sugocode-fn-collector"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location

  storage_account_name = azurerm_storage_account.sugocode-storage-account.name
  service_plan_id      = azurerm_service_plan.sugocode-svc-plan.id

  site_config {}
}

resource "azurerm_linux_function_app" "sugocode-fn-alarms" {
  name                = "sugocode-fn-alarms"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location

  storage_account_name = azurerm_storage_account.sugocode-storage-account.name
  service_plan_id      = azurerm_service_plan.sugocode-svc-plan.id

  site_config {}
}

resource "azurerm_linux_function_app" "sugocode-fn-reports" {
  name                = "sugocode-fn-reports"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location

  storage_account_name = azurerm_storage_account.sugocode-storage-account.name
  service_plan_id      = azurerm_service_plan.sugocode-svc-plan.id

  site_config {}
}