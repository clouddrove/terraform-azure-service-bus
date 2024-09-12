provider "azurerm" {
  features {}
  # subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
  subscription_id = "068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
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
  topics = [
    {
      name                = "example"
      enable_partitioning = true
      subscriptions = [
        {
          name               = "example"
          forward_to         = "destination"
          max_delivery_count = 1
        }
      ]

      authorization_rules = [
        {
          name   = "example"
          rights = ["listen", "send"]
        }
      ]
    }
  ]

}
