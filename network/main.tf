provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

locals {
  key          = "${var.workspace}"
  location     = "${lookup(var.config[var.workspace], "location")}"
  environment  = "${lookup(var.config[var.workspace], "environment")}"
  service_line = "${lookup(var.config[var.workspace], "service_line")}"
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-platform-demo-${local.key}"
  location = "${local.location}"

  tags {
    environment = "${local.environment}"
  }
}

resource "azurerm_virtual_network" "demo" {
  name                = "vnet-platform-demo-${local.key}"
  location            = "${local.location}"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  address_space       = ["10.0.0.0/16"]

  tags {
    environment  = "${local.environment}"
    service_line = "${local.service_line}"
  }
}

resource "azurerm_subnet" "demo_01" {
  name                 = "sn-platform-demo-${local.key}-01"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "demo_02" {
  name                 = "sn-platform-demo-${local.key}-02"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "demo_03" {
  name                 = "sn-platform-demo-${local.key}-03"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "demo_04" {
  name                 = "sn-platform-demo-${local.key}-04"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.4.0/24"
}

resource "azurerm_subnet" "demo_05" {
  name                 = "sn-platform-demo-${local.key}-05"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.5.0/24"
}

resource "azurerm_subnet" "demo_06" {
  name                 = "sn-platform-demo-${local.key}-06"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  address_prefix       = "10.0.6.0/24"
}
