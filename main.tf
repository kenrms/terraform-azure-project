#ok here you go, In Azure using terraform, create the following components
#Resource Group
#SQL Server
#0 or more (configurable) Function Apps
#0 or more (configurable) Logic Apps
#All of the above resources must be created inside a Virtual Network with Subnets and assigned a Network Security Group (NSG)
#The resulting code MUST BE reusable and use variables, outputs, and modules.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/azure-resource-group"
  location = var.location
  prefix   = var.prefix
}

module "vnet" {
  source              = "./modules/azure-vnet"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_address_space  = ["10.0.0.0/16"]

  depends_on = [module.resource_group]
}

module "nsg" {
  source              = "./modules/azure-network-security-group"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  rules = [{
    description                = "Some inbound NSG rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}

module "sql_subnet" {
  source                  = "./modules/azure-subnet"
  prefix                  = var.prefix
  resource_group_name     = module.resource_group.resource_group_name
  virtual_network_name    = module.vnet.vnet_name
  subnet_address_prefixes = [var.sql_subnet_address]
  nsg_id                  = module.nsg.nsg_id

  depends_on = [module.vnet, module.nsg]
}

module "sql_server" {
  source              = "./modules/azure-sql-server"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  admin_login         = var.sql_admin_login
  sql_subnet_id       = module.sql_subnet.subnet_ids[0]

  depends_on = [module.sql_subnet]
}

module "logic_apps" {
  source              = "./modules/azure-logic-app"
  prefix              = var.prefix
  location            = var.location
  logic_app_count     = var.logic_app_count
  resource_group_name = module.resource_group.resource_group_name
}

module "function_apps" {
  source              = "./modules/azure-function-app"
  prefix              = var.prefix
  location            = var.location
  function_app_count  = var.function_app_count
  resource_group_name = module.resource_group.resource_group_name
}