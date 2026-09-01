variable "aks" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    kubernetes_version = string
    node_resource_group = string

    identity_id = string
    subnet_id   = string

    node_pool_name = string
    vm_size        = string
    node_count     = number

  }))

}