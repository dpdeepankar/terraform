variable "rg_name" {
    type = string

}

variable "rg_location" {
    type = string
    default = "centralindia"
}

variable "vnet_name" {
    type = string
}

variable "vnet_address_space" {
    type = list
}

variable "subnet_name" {
    type = string
}

variable "subnet_address_prefixes" {
    type = list
}

///////////

variable "counts" {
    type = number
}

variable "nsg_name" {
    
}