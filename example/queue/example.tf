provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

module "service_bus" {
  source = "clouddrove/service-bus/azure"

  name        = "app"
  environment = "test"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  queues = [
    {
      name = "example"
      authorization_rules = [
        {
          name   = "example"
          rights = ["listen", "send"]
        }
      ]
    }
  ]
}
