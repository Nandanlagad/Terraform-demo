resource "aws_subnet" "web_sub" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    environment = "production"
    Name        = var.subnet_name
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = var.igw_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_route_table" "web_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id

  }
  tags = {
    Name        = var.route_table_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_route_table_association" "web_rta" {
  subnet_id      = aws_subnet.web_sub.id
  route_table_id = aws_route_table.web_rt.id
}
resource "aws_security_group" "web_sg" {

  name = var.security_group_name

  description = "Security group for web instance"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.security_group_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }

}

