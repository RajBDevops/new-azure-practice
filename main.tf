terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.11.2"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "ba36cc9c-677b-49bb-9da4-673ffc0e5b26"
}
