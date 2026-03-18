resource "azurerm_container_registry" "acr" {
	tags = {
		environment = "casopractico2"
	}
	
	name = "terraformacrunir"
	resource_group_name = azurerm_resource_group.rg.name
	location = azurerm_resource_group.rg.location
	sku = "Basic"
	admin_enabled = true
}

resource "azurerm_role_assignment" "ra-perm" {
	principal_id = azurerm_kubernetes_cluster.aks.identity[0].principal_id
	role_definition_name = "AcrPull"
	scope = azurerm_container_registry.acr.id
}
