resource "azurerm_postgresql_flexible_server" "this" {
  name                          = "psql-${var.name_prefix}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.pg_version
  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  zone                          = "1"
  public_network_access_enabled = true
  tags                          = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "app" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

variable "name_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "administrator_login" { type = string }
variable "administrator_password" {
  type      = string
  sensitive = true
}
variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}
variable "storage_mb" {
  type    = number
  default = 32768
}
variable "pg_version" {
  type    = string
  default = "16"
}
variable "db_name" {
  type    = string
  default = "erp"
}
variable "tags" {
  type    = map(string)
  default = {}
}

output "fqdn" { value = azurerm_postgresql_flexible_server.this.fqdn }
output "server_name" { value = azurerm_postgresql_flexible_server.this.name }
output "db_name" { value = azurerm_postgresql_flexible_server_database.app.name }
