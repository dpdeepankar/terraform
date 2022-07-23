resource "azurerm_network_interface" "nic" {
    count = var.counts

    name = "node${count.index}_nic"
    resource_group_name = azurerm_resource_group.RG.name
    location = azurerm_resource_group.RG.location

    ip_configuration {
      name = "ipconfig"
      subnet_id = azurerm_subnet.subnet[0].id
      private_ip_address_allocation = "Dynamic"
    }
}