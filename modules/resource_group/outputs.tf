output "id" {
  value = {
    for key, rg in azurerm_resource_group.rg : key => rg.id
  }
}

output "name" {
  value = {
    for key, rg in azurerm_resource_group.rg : key => rg.name
  }
}

output "location" {
  value = {
    for key, rg in azurerm_resource_group.rg : key => rg.location
  }
}