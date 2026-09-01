output "id" {

  value = {
    for key, acr in azurerm_container_registry.acr : key => acr.id
  }

}

output "name" {

  value = {
    for key, acr in azurerm_container_registry.acr : key => acr.name
  }

}

output "login_server" {

  value = {
    for key, acr in azurerm_container_registry.acr : key => acr.login_server
  }

}