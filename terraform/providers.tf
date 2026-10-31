provider "azurerm" {
  features {}

  # subscription_id is required by the azurerm v4 provider at plan/apply time.
  # Supply it here via var, or via the ARM_SUBSCRIPTION_ID environment variable.
  subscription_id = var.subscription_id != "" ? var.subscription_id : null
}
