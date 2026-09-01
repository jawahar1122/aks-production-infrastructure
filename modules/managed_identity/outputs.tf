output "id" {

  value = {
    for key, identity in azurerm_user_assigned_identity.identity :
    key => identity.id
  }

}

output "principal_id" {

  value = {
    for key, identity in azurerm_user_assigned_identity.identity :
    key => identity.principal_id
  }

}

output "client_id" {

  value = {
    for key, identity in azurerm_user_assigned_identity.identity :
    key => identity.client_id
  }

}

output "name" {

  value = {
    for key, identity in azurerm_user_assigned_identity.identity :
    key => identity.name
  }

}