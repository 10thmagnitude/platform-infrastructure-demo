provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

locals {
  location    = "${lookup(var.environments[terraform.workspace], "location")}"
  environment = "${lookup(var.environments[terraform.workspace], "environment")}"
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-platform-demo"
  location = "${local.location}"

  tags {
    environment = "${local.location}"
  }
}

resource "azurerm_virtual_network" "demo" {
  name                = "vnet-platform-demo"
  location            = "${local.location}"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  address_space       = ["10.0.0.0/16"]

  tags {
    environment = "${local.location}"
  }
}

resource "azurerm_subnet" "demo_01" {
  name                 = "sn-platform-demo-01"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "demo_02" {
  name                 = "sn-platform-demo-02"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "demo_03" {
  name                 = "sn-platform-demo-03"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.3.0/24"
}
