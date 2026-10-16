
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name        = var.subnet_1_name
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

resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.web_rt.id
}

resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "Security group for web instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from the permitted public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.150.138.238/32"]
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
