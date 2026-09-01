variable "rgs" {
    type = map(object({
        name = string 
        location = string
    }))
}


variable "vnets" {
    type = map(object({
        name = string
        resource_group_name = string
        location = string
        address_space = list(string)
    }))
}


variable "subnets" {
    type = map(object({
        name = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes = list(string)
    }))
}

variable "nsgs" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
    }))
}

variable "acrs" {

  type = map(object({

    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

  }))

}

variable "identities" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

  }))

}

variable "key_vaults" {

  type = map(object({

    name                       = string
    location                   = string
    resource_group_name        = string
    tenant_id                  = string
    sku_name                   = string
    purge_protection_enabled   = bool
    soft_delete_retention_days = number

  }))

}