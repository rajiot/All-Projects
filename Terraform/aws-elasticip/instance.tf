resource "aws_instance" "terraform-test" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name = "first tf instance"
  }
}
resource "aws_eip" "lb" {
  instance = aws_instance.terraform-test.id
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {

instance_id = aws_instance.terraform-test.id

allocation_id = aws_eip.lb.id
}