variable "subscription_id" {
  description = "Azure subscription id (or set ARM_SUBSCRIPTION_ID)."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Short prefix for resource names."
  type        = string
  default     = "erpplat"
}

variable "environment" {
  description = "Deployment environment (dev/staging/prod)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "southeastasia"
}

variable "node_count" {
  description = "Number of nodes in the AKS system node pool."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes."
  type        = string
  default     = "Standard_B2s"
}

variable "pg_admin_login" {
  description = "PostgreSQL administrator login."
  type        = string
  default     = "pgadmin"
}

variable "pg_admin_password" {
  description = "PostgreSQL administrator password (supply via tfvars or a secret, never commit)."
  type        = string
  sensitive   = true
  default     = ""
}

variable "pg_sku" {
  description = "PostgreSQL Flexible Server SKU."
  type        = string
  default     = "B_Standard_B1ms"
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
  default = {
    project    = "erp-platform"
    managed_by = "terraform"
  }
}
