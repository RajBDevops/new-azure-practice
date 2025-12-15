#creating storage account

variable "my_storage_account" {
    type = string
    default = "9871234tfstore1987"
  
}
resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.my_storage_account
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
 
  }
  
