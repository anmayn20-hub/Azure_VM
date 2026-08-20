rgs = {
  rg1 = {
    name     = "dev-rg"
    location = "central india"
  }
  rg2 = {
    name     = "test-rg"
    location = "central india"
  }
  rg3 = {
    name     = "qa-rg"
    location = "central india"
  }
}

vnets = {
  vnet1 = {
    name                = "dev-vnet"
    location            = "central india"
    resource_group_name = "dev-rg"
    address_space       = ["10.143.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "dev-backend-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.143.10.0/24"]
  }

  subnet2 = {
    name                 = "dev-frontend-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.143.20.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "dev-backend-pip"
    resource_group_name = "dev-rg"
    location            = "central india"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "dev-frontend-pip"
    resource_group_name = "dev-rg"
    location            = "central india"
    allocation_method   = "Static"
  }
}

vms = {
  nic1 = {
    subnet_name          = "dev-backend-subnet"
    virtual_network_name = "dev-vnet"
    pip_name             = "dev-backend-pip"
    name                 = "dev-backend-nic"
    location             = "central india"
    resource_group_name  = "dev-rg"
    vm_name              = "backend-vm"
    admin_username       = "adminuser"
    admin_password       = "Welcome@2020"
  }

  nic2 = {
    subnet_name          = "dev-frontend-subnet"
    virtual_network_name = "dev-vnet"
    pip_name             = "dev-frontend-pip"
    name                 = "dev-frontend-nic"
    location             = "central india"
    resource_group_name  = "dev-rg"
    vm_name              = "frontend-vm"
    admin_username       = "adminuser"
    admin_password       = "Welcome@2020"
  }
}