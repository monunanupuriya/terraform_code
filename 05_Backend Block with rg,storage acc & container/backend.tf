terraform {

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesaccount123"                              
    container_name       = "backendcontainer"                               
    key                  = "backend.terraform.tfstate"                
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "9ae44b4d-7967-4561-84e0-066ac02817fd"
}

resource "azurerm_resource_group" "rgbackend" {
  name     = "mk-rg-backend"
  location = "Central India"
}

resource "azurerm_storage_account" "stg" {
  name                     = "stgbackendtf2024"
  resource_group_name      = azurerm_resource_group.rgbackend.name
  location                 = azurerm_resource_group.rgbackend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.stg.id
  container_access_type = "private"
}
