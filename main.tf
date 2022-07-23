# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "resource_group" {
    name = "TEST-RG1"
    location = "Central India"
}

resource "azurerm_storage_account" "bootdiagnosticsa"{
    name = "thinkbootdiagnosticsa"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}


resource "azurerm_network_security_group" "subnet-NSG1" {
    name = "subnet-test-nsg"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_network_security_group" "nic-NSG2" {
    name = "nic-test-nsg"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_virtual_network" "vnet" {
    name = "test-vnet1"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name
    address_space = ["10.10.0.0/16"]
}
resource "azurerm_subnet" "subnet" {
        name = "test-subnet1"
        address_prefixes = ["10.10.10.0/24"]
        virtual_network_name = azurerm_virtual_network.vnet.name
        resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.subnet-NSG1.id
}

resource "azurerm_network_interface" "nic1" {
    name = "node1_nic"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name

    ip_configuration {
      name = "ipconfig01"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "nic2" {
    name = "node2_nic"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name

    ip_configuration {
      name = "ipconfig01"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "nic3" {
    name = "node3_nic"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name

    ip_configuration {
      name = "ipconfig01"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "nic4" {
    name = "node4_nic"
    location = azurerm_resource_group.resource_group.location
    resource_group_name = azurerm_resource_group.resource_group.name

    ip_configuration {
      name = "ipconfig01"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}


resource "azurerm_linux_virtual_machine" "VM1" {
    name = "node1"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    size = "Standard_B2s"
    admin_username = "osadmin"
    admin_password = "Znwo@sk2h3p5xDX4"
    disable_password_authentication = false

    network_interface_ids = [ 
        azurerm_network_interface.nic1.id
    ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    boot_diagnostics {
      storage_account_uri = azurerm_storage_account.bootdiagnosticsa.primary_blob_endpoint
    }

}

resource "azurerm_linux_virtual_machine" "VM2" {
    name = "node2"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    size = "Standard_B2s"
    admin_username = "osadmin"
    admin_password = "Znwo@sk2h3p5xDX4"
    disable_password_authentication = false

    network_interface_ids = [ 
        azurerm_network_interface.nic2.id
    ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    boot_diagnostics {
      storage_account_uri = azurerm_storage_account.bootdiagnosticsa.primary_blob_endpoint
    }

}

resource "azurerm_linux_virtual_machine" "VM3" {
    name = "node3"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    size = "Standard_B2s"
    admin_username = "osadmin"
    admin_password = "Znwo@sk2h3p5xDX4"
    disable_password_authentication = false

    network_interface_ids = [ 
        azurerm_network_interface.nic3.id
    ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    boot_diagnostics {
      storage_account_uri = azurerm_storage_account.bootdiagnosticsa.primary_blob_endpoint
    }

}

resource "azurerm_linux_virtual_machine" "VM4" {
    name = "node4"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    size = "Standard_B2s"
    admin_username = "osadmin"
    admin_password = "Znwo@sk2h3p5xDX4"
    disable_password_authentication = false

    network_interface_ids = [ 
        azurerm_network_interface.nic4.id
    ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    boot_diagnostics {
      storage_account_uri = azurerm_storage_account.bootdiagnosticsa.primary_blob_endpoint
    }


}