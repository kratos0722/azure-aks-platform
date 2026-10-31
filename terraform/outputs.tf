output "resource_group" {
  description = "Resource group holding the platform."
  value       = azurerm_resource_group.this.name
}

output "acr_login_server" {
  description = "ACR login server for pushing images."
  value       = module.acr.login_server
}

output "aks_cluster_name" {
  description = "AKS cluster name (use with az aks get-credentials)."
  value       = module.aks.cluster_name
}

output "postgres_fqdn" {
  description = "PostgreSQL Flexible Server FQDN."
  value       = module.postgres.fqdn
}

output "app_insights_connection_string" {
  description = "Application Insights connection string."
  value       = module.observability.app_insights_connection_string
  sensitive   = true
}
