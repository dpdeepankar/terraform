terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
}
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

variable "counts" {
    type = number
}

variable "nsg_name" {}

module "testmodule" {
  source = "./modules/"
  
    rg_name = var.rg_name
    rg_location = var.rg_location
    vnet_name = var.vnet_name
    vnet_address_space = var.vnet_address_space
    subnet_name = var.subnet_name
    subnet_address_prefixes = var.subnet_address_prefixes
    counts = var.counts
    nsg_name = var.nsg_name
}