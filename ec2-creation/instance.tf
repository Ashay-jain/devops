# creating key pair
resource "aws_key_pair" "tfkey" {
  key_name   = "tfkey1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3SWQT63WwH2t2RTi8ZnEoqdBVAbrIW96c1mHNhucd3Tf64GGS1Pxzrs1nF4Rz+R5B0WXVvNpXGgmU6qO6lGHUCsuHfwZXjud+zohqgJU4YHWmwrwFT/IoVv059lKIFJZHLHJI6azQbhDpztAX7Ig6LdiGqoQ0bPo1l8z1bOlaAZG46nZSJ3z85wstDUCU2ox8TFweFI2CoE/TO7D+x+qU0kkixSSLEf59Z4QWSpH/vPSBWlMTuq8UfLpgeXNXha7B5Z30zDuxu1MCVG/uitq4opkYniLY8Hmj9JeaQeHL16hcoMxs3JaErHYED6sMXZHa5SyQV4OxzrPU87Vl6ADp4MP/VSTugxpk5vJGrO5S4MqYhUmWlYMlHbKk5nw2ysK29kMMfvMl+Nw+ugqHGQJsZRCGB6CLo2VC0Ha7DyqPQMeL6KF7FPtkwKffT/zSg1wTI8anddLHD0BDrpGrskxeTAg/7md4JB3kmMjfZOIuEH5NefbO86Z63emFMdNMlnE= masterkey"
}


output "keypairname" {
  value = aws_key_pair.tfkey.key_name
}
# creating sg
resource "aws_security_group" "allow_tls" {
  name        = "tf-sg1"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [80, 443, 3306, 8080,22]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

output "awssgoutsgid" {
  value = "${aws_security_group.allow_tls.id}"

}

#creating instance
resource "aws_instance" "firstec2" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.tfkey.key_name}"
  tags = {
    Name = "tf-aj1"
  }
  vpc_security_group_ids = [ "${aws_security_group.allow_tls.id}"   ]
}
#outputing the public ip of instance  
output "publicip" {
  value = aws_instance.firstec2.public_ip
}