output "id" {

  value = {
    for key, association in azurerm_subnet_network_security_group_association.association :
    key => association.id
  }

}