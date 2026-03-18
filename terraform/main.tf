terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = "~>3.0"
		}
	}
}

provider "azurerm" {
	features {
		resource_group {
			prevent_deletion_if_contains_resources = false
		}
	}
}

resource "azurerm_resource_group" "rg" {
	tags = {
                environment = "casopractico2"
        }

	name = "EjerTerraform"
	location = var.location
}

resource "azurerm_virtual_network" "vnet" {
	tags = {
                environment = "casopractico2"
        }

	name                = "vnet-terraform"
	address_space       = ["10.0.0.0/16"]
	location            = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
	name                 = "internal-subnet"
	resource_group_name  = azurerm_resource_group.rg.name
	virtual_network_name = azurerm_virtual_network.vnet.name
	address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
	tags = {
                environment = "casopractico2"
        }

	name                = "vm-public-ip"
	location            = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name
	sku               = "Standard"
	allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
	tags = {
                environment = "casopractico2"
        }

	name                = "vm-nic"
	location            = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name

	ip_configuration {
		name                          = "Configuracion_IP"
		subnet_id                     = azurerm_subnet.subnet.id
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id          = azurerm_public_ip.pip.id
  }
}
