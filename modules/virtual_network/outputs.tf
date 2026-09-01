output "id" {
    value = {
        for key, vnet in azurerm_virtual_network.vnet : key => vnet.id
    }
}

output "name" {

  value = {
    for key, vnet in azurerm_virtual_network.vnet : key => vnet.name
  }

}