output "id" {

  value = {
    for key, kv in azurerm_key_vault.kv :
    key => kv.id
  }

}

output "name" {

  value = {
    for key, kv in azurerm_key_vault.kv :
    key => kv.name
  }

}

output "vault_uri" {

  value = {
    for key, kv in azurerm_key_vault.kv :
    key => kv.vault_uri
  }

}