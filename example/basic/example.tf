provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  label_order = ["name", "environment"]
  name        = "rg"
  environment = "test"
  location    = "Canada Central"
}

module "service_bus" {
  source = "./../.."

  name        = "example-huro"
  environment = "test"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  sku                 = "Basic"
}