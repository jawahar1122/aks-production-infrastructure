output "id" {

  value = {
    for key, aks in azurerm_kubernetes_cluster.aks :
    key => aks.id
  }

}

output "name" {

  value = {
    for key, aks in azurerm_kubernetes_cluster.aks :
    key => aks.name
  }

}

output "fqdn" {

  value = {
    for key, aks in azurerm_kubernetes_cluster.aks :
    key => aks.fqdn
  }

}