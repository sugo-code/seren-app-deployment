terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name     = "CLOD_PW2_temp"
  location = "West Europe"
}

resource "azurerm_storage_account" "sugocode-storage-account" {
  name                     = "sugocode"
  resource_group_name      = azurerm_resource_group.resource-group.name
  location                 = azurerm_resource_group.resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "prd"
  }
}
