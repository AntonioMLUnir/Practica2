resource "azurerm_linux_virtual_machine" "vm" {
	os_disk {
		name = "myosdisk"
		caching = "ReadWrite"
		storage_account_type = "Standard_LRS"	
		disk_size_gb = 30
	}

	source_image_reference {
		publisher = "Canonical"
		offer     = "0001-com-ubuntu-server-jammy"
		sku       = "22_04-lts"
		version   = "latest"
	}

	tags = {
                environment = "casopractico2"
        }

	name = "terraform-vm"
	resource_group_name = azurerm_resource_group.rg.name
	location = azurerm_resource_group.rg.location
	size = var.vm_size
	admin_username = var.admin_username
	network_interface_ids = [azurerm_network_interface.nic.id]
	

	admin_ssh_key {
		username = "azureuser"
		public_key = tls_private_key.ssh_key.public_key_openssh
	}
}
	
