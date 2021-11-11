terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "~> 2.84.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "subscriptionid_1"
}

resource "azurerm_resource_group" "resource_group" {
  name = "TestResourceGroup2"
  location = "West Europe"
}

module "prod_module" {
  source = "../prod"
}
