resource "azurerm_kubernetes_cluster" "aks" {
	tags = {
                environment = "casopractico2"
        }

	name = "terraform-aks-unir"
	location = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name
	role_based_access_control_enabled = true
	dns_prefix = "terraformaksunir"
	sku_tier = "Standard"
	
	default_node_pool {
		name = "default"
		node_count = 1
		vm_size = var.vm_size
	}
	
	identity {
		type = "SystemAssigned"
	}
}
