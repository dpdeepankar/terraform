resource "azurerm_linux_virtual_machine" "VM" {
    count = var.counts
    name = "node${count.index}"
    resource_group_name = azurerm_resource_group.RG.name
    location = azurerm_resource_group.RG.location
    size = "Standard_B2s"

    admin_username = "osadmin"
    admin_password = "Znwo@sk2"
    disable_password_authentication = false

    network_interface_ids = [ 
        azurerm_network_interface.nic[count.index].id
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

}

