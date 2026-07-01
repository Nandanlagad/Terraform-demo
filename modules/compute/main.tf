
resource "aws_instance" "web_instance" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name        = var.instance_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
  key_name = var.key_name
}