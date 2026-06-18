module "network" {

  source = "./modules/network"

}


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

  subnet_id = module.network.subnet_id

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
  vpc_id      = module.network.vpc_id

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

resource "aws_internet_gateway" "web_igw" {
  vpc_id = module.network.vpc_id
  tags = {
    Name        = "web-igw"
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_route_table" "web_rt" {
  vpc_id = module.network.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id
  }
  tags = {
    Name        = "web-rt"
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}
resource "aws_route_table_association" "web_rta" {
  subnet_id      = module.network.subnet_id
  route_table_id = aws_route_table.web_rt.id
}

