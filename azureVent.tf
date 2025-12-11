# Create a virtual network within the resource group


resource "azurerm_virtual_network" "my-network" {
  name                = "app_network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
 

  subnet {
    name             = "subnetA"
    address_prefixes = ["10.0.1.0/24"]
  }

  }