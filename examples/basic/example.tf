provider "azurerm" {
  features {}
  subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
}

locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = local.name
  environment = local.environment
  label_order = local.label_order
  location    = "Canada Central"
}

module "service_bus" {
  source = "../.."

  name        = local.name
  environment = local.environment

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  sku                 = "Basic"
}
