resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
  
  #sem chave ssh
  #admin_ssh_key {
  #  username   = "adminuser"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

#AWS Provider
resource "aws_instance" "dev" {
    count = 3
    ami = "ami-085925f297f89fce1"
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      name = "dev${count.index}"
    }
#    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}","${aws_security_group.allow_rdp.id}"] 
}

resource "aws_instance" "dev8" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      name = "dev8"
    }
#    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
#    depends_on = [aws_s3_bucket.dev11]
}

#resource "aws_instance" "dev9" {
#    provider = "aws.us-east-2"
#    ami = var.amis["us-east-2"]
#    instance_type = "t2.micro"
#    key_name = "osanam-terraform"
#    tags = {
#      name = "dev9"
#    }
#    vpc_security_group_ids = ["${aws_security_group.allow_ssh-us-east-2.id}"]
#    depends_on = ["aws_dynamodb_table.dynamodb-hom"]
#}

#resource "aws_instance" "dev10" {
#    provider = "aws.us-east-2"
#    ami = var.amis["us-east-2"]
#    instance_type = "t2.micro"
#    key_name = var.key_name
#    tags = {
#      name = "dev10"
#    }
#   vpc_security_group_ids = ["${aws_security_group.allow_ssh-us-east-2.id}"]
#}




    