module "azurerm_resource_group" {
  source    = "../../Module/1.azurerm_resource_group"
  rg_detail = var.rgs
}

module "azurerm_virtual_network" {
  depends_on  = [module.azurerm_resource_group]
  source      = "../../Module/2.azurerm_virtual_network"
  vnet_detail = var.vnets
}

module "azurerm_subnet" {
  depends_on    = [module.azurerm_virtual_network]
  source        = "../../Module/3.azurerm_subnet"
  subnet_detail = var.subnets
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Module/4.azurerm_public_ip"
  pip_detail = var.pips
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../Module/5.azurerm_virtual_machine"
  nic_detail = var.vms
}