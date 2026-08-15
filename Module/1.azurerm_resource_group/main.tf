resource "azurerm_resource_group" "rg-dev" {
  for_each = var.rg_detail
  name     = each.value.name
  location = each.value.location
}