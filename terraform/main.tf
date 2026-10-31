locals {
  base = "${var.name_prefix}-${var.environment}"
  tags = merge(var.tags, { environment = var.environment })
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.base}"
  location = var.location
  tags     = local.tags
}

module "network" {
  source              = "./modules/network"
  name_prefix         = local.base
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags
}

module "observability" {
  source              = "./modules/observability"
  name_prefix         = local.base
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags
}

module "acr" {
  source              = "./modules/acr"
  name                = replace("acr${local.base}", "-", "")
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags
}

module "aks" {
  source                     = "./modules/aks"
  name_prefix                = local.base
  location                   = var.location
  resource_group_name        = azurerm_resource_group.this.name
  subnet_id                  = module.network.aks_subnet_id
  acr_id                     = module.acr.acr_id
  log_analytics_workspace_id = module.observability.workspace_id
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  tags                       = local.tags
}

module "postgres" {
  source                 = "./modules/postgres"
  name_prefix            = local.base
  location               = var.location
  resource_group_name    = azurerm_resource_group.this.name
  administrator_login    = var.pg_admin_login
  administrator_password = var.pg_admin_password
  sku_name               = var.pg_sku
  tags                   = local.tags
}
