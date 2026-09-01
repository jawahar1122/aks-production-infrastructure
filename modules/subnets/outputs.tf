output "id" {
    value = {
        for key, subnet in azurerm_subnet.subnet : key => subnet.id
    }
}

output"name" {
    value = {
        for key, subnet in azurerm_subnet.subnet : key => subnet.name
    }
}