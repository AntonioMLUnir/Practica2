resource "azurerm_storage_account" "storage" {
	tags = {
                environment = "casopractico2"
        }

	name = "terraformstgunir"
	resource_group_name = azurerm_resource_group.rg.name
	location = azurerm_resource_group.rg.location
	account_tier = "Standard"
	account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
	name = "terraform-container"
	storage_account_name = azurerm_storage_account.storage.name
	container_access_type = "private"
}
