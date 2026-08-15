data "azurerm_subnet" "subnet-data" {
  for_each             = var.nic_detail
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip-data" {
  for_each            = var.nic_detail
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "nic-dev" {
  for_each            = var.nic_detail
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip-data[each.key].id
    private_ip_address_allocation = "Dynamic"

  }
}


resource "azurerm_linux_virtual_machine" "dev-vm" {
  for_each                        = var.nic_detail
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_D2s_v3"
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = "false"
  network_interface_ids           = [azurerm_network_interface.nic-dev[each.key].id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}