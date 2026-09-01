module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rgs
  
}

module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../../modules/virtual_network"
    vnets = var.vnets
}

module "subnet" {
    depends_on = [module.virtual_network]
    source = "../../modules/subnets"
    subnets = var.subnets
}

module "network_security_group" {
    depends_on = [module.resource_group]
    source= "../../modules/network_security_group"
    nsgs = var.nsgs
}

module "subnet_nsg_association" {

    depends_on = [module.network_security_group]
    source = "../../modules/subnet_nsg_association"
    
    associations = {

    aks = {

      subnet_id = module.subnet.id["subnet1"]
      network_security_group_id = module.network_security_group.id["nsg1"]

    }

  }

}


module "container_registry" {

    depends_on = [module.resource_group]
    source = "../../modules/container_registry"
    acrs = var.acrs

}

module "managed_identity" {

  source = "../../modules/managed_identity"

  identities = var.identities

  depends_on = [
    module.resource_group
  ]

}

module "key_vault" {

  source = "../../modules/key_vault"

  key_vaults = var.key_vaults

  depends_on = [
    module.resource_group,
    module.managed_identity
  ]

}


module "aks" {

  source = "../../modules/aks"

  aks = {

    aks1 = {

      name                = "aks-prod"
      location            = "central india"
      resource_group_name = "aks-rg"
      dns_prefix          = "aks-prod"

      kubernetes_version = "1.36.3"

      node_resource_group = "aks-prod-node-rg"

      identity_id = module.managed_identity.id["aks"]

      subnet_id = module.subnet.id["subnet1"]

      node_pool_name = "system"
      vm_size        = "Standard_D2_v3"
      node_count     = 1

    }

  }

  depends_on = [

    module.resource_group,
    module.virtual_network,
    module.subnet,
    module.network_security_group,
    module.subnet_nsg_association,
    module.managed_identity,
    module.container_registry,
    module.key_vault

  ]

}