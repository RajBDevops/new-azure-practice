data "azurerm_subnet" "subnetA"{
  name = "subnetA"
    virtual_network_name = azurerm_virtual_network.my-network.name
    resource_group_name = azurerm_resource_group.rg.name
}
#createing virtual machine
resource "azurerm_network_interface" "my-nic" {
  name                = "my-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "my-vm" {
  name                  = "myVM"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my-nic.id]
  vm_size               = "Standard_D2s_v4"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "XXXXXXXXX"
    admin_username = "XXXXXXXX"
    admin_password = "XXXXXXXXXXX"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 
}
