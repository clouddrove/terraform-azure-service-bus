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

  topics = [
    {
      name                = "source"
      enable_partitioning = true
      subscriptions = [
        {
          name               = "example"
          forward_to         = "destination"
          max_delivery_count = 1
        }
      ]
    },
    {
      name                = "destination"
      enable_partitioning = true
    }
  ]
}
