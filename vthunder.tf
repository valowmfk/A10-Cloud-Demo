# # Create A10 ADC

 resource "aws_instance" "vthunder1" {
  ami               = "ami-0ac5b3417d816d282"
  instance_type     = "m4.xlarge"
  key_name          = "A10-Cloud-Demo"
  availability_zone = data.aws_availability_zones.available.names[0]
   network_interface {
    network_interface_id = aws_network_interface.vth-mngt-nic1.id
    device_index         = "0"
  }
   network_interface {
    network_interface_id = aws_network_interface.vth-public-nic1.id
    device_index         = "1"
    }   
   network_interface {
    network_interface_id = aws_network_interface.vth-private-nic1.id
    device_index         = "2"
  }
  tags = {
    Name = "${var.project}-ADC-1"
    }
 }
  resource "aws_instance" "vthunder2" {
  ami               = "ami-0ac5b3417d816d282"
  instance_type     = "m4.xlarge"
  key_name          = "A10-Cloud-Demo"
  availability_zone = data.aws_availability_zones.available.names[1]
   network_interface {
    network_interface_id = aws_network_interface.vth-mngt-nic2.id
    device_index         = "0"
  }
  tags = {
    Name = "${var.project}-ADC-2"
  }
   network_interface {
    network_interface_id = aws_network_interface.vth-public-nic2.id
    device_index         = "1"
    }   
   network_interface {
    network_interface_id = aws_network_interface.vth-private-nic2.id
    device_index         = "2"
  }
}
