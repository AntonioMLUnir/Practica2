variable "resource_group_name" {
	description = "Nombre del Resource Group"
	type = string
	default = "EjerTerraform"
}

variable "location" {
	description = "Región de Azure"
	type = string
	default = "switzerlandnorth"
}

variable "vm_size" {
	description = "Tamaño de la máquina virtual"
	type = string
	default = "Standard_B2s_v2"
}

variable "admin_username" {
	description = "Usuario administrador de la VM"
	type = string
	default = "azureuser"
}

variable "subnet_id" {
	description = "ID de la subnet"
	type = string
	default = ""
}
