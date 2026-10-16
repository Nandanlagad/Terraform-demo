module "network" {

  source = "./modules/network"

  vpc_cidr            = var.main_vpc_cidr
  subnet_1_cidr       = var.main_subnet_1_cidr
  subnet_1_name       = var.main_subnet_1_name
  az_1                = var.main_az_1
  security_group_name = var.main_security_group_name
  route_table_name    = var.main_route_table_name
  igw_name            = var.main_igw_name
  vpc_name            = var.main_vpc_name


}

locals {
  ami_id        = "ami-0eef9d717347382c1"
  instance_type = "t3.micro"
  instance_name = "web-instance"
}

module "compute" {
  source = "./modules/compute"

  ami_id            = local.ami_id
  instance_type     = local.instance_type
  subnet_id         = module.network.subnet_1_id
  security_group_id = module.network.security_group_id
  instance_name     = local.instance_name
  key_name          = "web-instance-key"
}

data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

module "iam" {
  source             = "./modules/iam"
  role_name          = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

