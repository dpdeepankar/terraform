resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    location = azurerm_resource_group.RG.location
    address_space = var.vnet_address_space
    resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "subnet" {
    count = length(var.subnet_address_prefixes)
    name = "${var.subnet_name}_${count.index}"
    resource_group_name = azurerm_resource_group.RG.name
    address_prefixes = [ "${var.subnet_address_prefixes[count.index]}" ]
    virtual_network_name = azurerm_virtual_network.vnet.name
}