resource "aws_network_interface" "eth1" {
  subnet_id   = "subnet-05fd7c363f165a409"
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.eth1.id
    device_index         = 0
  }

  root_block_device {
    volume_size = var.vol_size
    volume_type = var.vol_type
  }

user_data = templatefile(var.user_data, { "name" = "test"})
tags = merge({Name = var.name},var.ec2_tags)

}