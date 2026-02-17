resource "azurerm_storage_account" "stg" {
  name                     = "mkstorageacct010165464"
  resource_group_name      = "mk-rg012"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}