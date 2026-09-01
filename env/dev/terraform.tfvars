rgs = {
    rg1 = {
        name = "aks-rg"
        location = "central india"
    }
}

vnets = {
    vnet1 = {
        name = "aks-vnet"
        resource_group_name = "aks-rg"
        location = "central india"
        address_space = ["10.0.0.0/16"]

    }
}

subnets = {
    subnet1 = {
        name = "aks-subnet"
        resource_group_name = "aks-rg"
        virtual_network_name = "aks-vnet"
        address_prefixes = ["10.0.1.0/24"]
    }
}


nsgs = {
    nsg1 = {
        name = "aks-nsg"
        location = "central india"
        resource_group_name = "aks-rg"
    }
}

acrs = {

  acr1 = {

    name                = "aksacrprod12345"
    resource_group_name = "aks-rg"
    location            = "central india"
    sku                 = "Standard"
    admin_enabled       = false

  }

}

identities = {

  aks = {

    name                = "aks-identity"
    location            = "central india"
    resource_group_name = "aks-rg"

  }

}

key_vaults = {

  aks = {

    name                       = "aks-kv-prod123"
    location                   = "central india"
    resource_group_name        = "aks-rg"
    tenant_id                  = "d5b17a68-9790-4a55-802b-525825d32a27"
    sku_name                   = "standard"
    purge_protection_enabled   = true
    soft_delete_retention_days = 7

  }

}