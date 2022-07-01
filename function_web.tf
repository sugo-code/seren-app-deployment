resource "azurerm_service_plan" "sugocode-svc-plan-web" {
  name                = "sugocode-svc-plan-web"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "sugocode-web-app" {
  name                  = "sugocode-web-app"
  resource_group_name   = azurerm_resource_group.resource-group.name
  location              = azurerm_resource_group.resource-group.location
  service_plan_id       = azurerm_service_plan.sugocode-svc-plan-web.id

  site_config {
    always_on           = false

    virtual_application {
      physical_path = "site\\wwwroot"
      preload       = false
      virtual_path  = "/"
    }
  }
}
