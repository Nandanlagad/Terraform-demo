

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web_instance" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = aws_subnet.web_sub.id

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name        = var.instance_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}

resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "Security group for web instance"
  vpc_id      = aws_vpc.main.id
}
resource "aws_subnet" "web_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    environment = "production"
    name        = "web-subnet"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "main-vpc"
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }

}
