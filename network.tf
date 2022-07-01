resource "azurerm_network_security_group" "sugocode-security-group" {
    name                = "sugocode-security-group"
    location            = azurerm_resource_group.resource-group.location
    resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_virtual_network" "sugocode-virtual-network" {
    name                = "sugocode-virtual-network"
    location            = azurerm_resource_group.resource-group.location
    resource_group_name = azurerm_resource_group.resource-group.name
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnet {
        name           = "subnet1"
        address_prefix = "10.0.1.0/24"
        security_group = azurerm_network_security_group.sugocode-security-group.id
    }
}