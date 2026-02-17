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

resource "azurerm_resource_group" "rg_stg" {
  name     = "mk-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "stg" {
    depends_on = [ azurerm_resource_group.rg_stg ]
  name                     = "mkstgaccount2024"
  resource_group_name      = "mk-rg"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}