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

  subscription_id            = "subscriptionid_1"
  alias                      = "test"
  skip_provider_registration = true
}

provider "azurerm" {
  features {}

  subscription_id            = "subscriptionid_2"
  alias                      = "prod"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "test_resource_group" {
  name     = "TestResourceGroup"
  location = "West Europe"

  provider = azurerm.test
}

resource "azurerm_resource_group" "prod_resource_group" {
  name     = "ProductionResourceGroup"
  location = "West Europe"

  provider = azurerm.prod
}

module "test_module" {
  source = "./modules/test"
}
