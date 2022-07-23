resource "azurerm_network_security_group" "nsg" {
    count = length(var.nsg_name)
    name = "${var.nsg_name[count.index]}"
    location = azurerm_resource_group.RG.location
    resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
    subnet_id = azurerm_subnet.subnet[0].id
    network_security_group_id = azurerm_network_security_group.nsg[0].id
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
    network_security_group_id = azurerm_network_security_group.nsg[1].id
    count = 2
    network_interface_id = azurerm_network_interface.nic[count.index + 2].id
}