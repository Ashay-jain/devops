resource "aws_instance" "firstec2" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  tags = {
    Name = "tf-aj1"
  }
}