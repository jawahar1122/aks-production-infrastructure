resource "azurerm_kubernetes_cluster" "aks" {

  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  kubernetes_version = each.value.kubernetes_version

  node_resource_group = each.value.node_resource_group

  identity {
    type = "UserAssigned"

    identity_ids = [
      each.value.identity_id
    ]
  }

  default_node_pool {

    name       = each.value.node_pool_name
    vm_size    = each.value.vm_size
    node_count = each.value.node_count

    vnet_subnet_id = each.value.subnet_id

  }

  network_profile {

    network_plugin    = "azure"
    load_balancer_sku = "standard"
    service_cidr   = "10.1.0.0/16"
    dns_service_ip = "10.1.0.10"

  }

}