terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "9ae44b4d-7967-4561-84e0-066ac02817fd"
}

resource "azurerm_resource_group" "rg" {
  name    = "mk-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg" {
  name                     = "mkstg0101"
  resource_group_name      = "mk-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
