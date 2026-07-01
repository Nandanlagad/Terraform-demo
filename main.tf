module "network" {
  source              = "./modules/network"
  vpc_cidr            = "10.0.0.0/16"
  subnet_1_cidr       = "10.0.10.0/24"
  subnet_2_cidr       = "10.0.20.0/24"
  az_1                = "ap-south-1a"
  az_2                = "ap-south-1b"
  security_group_name = "web-sg"

  route_table_name = "web-rt"

  igw_name = "web-igw"

  vpc_name = "main-vpc"

}

locals {

  ami_id        = "ami-0eef9d717347382c1"
  instance_type = "t3.micro"
  instance_name = "web-instance"

}

module "compute" {

  source = "./modules/compute"

  ami_id = local.ami_id

  instance_type = local.instance_type

  subnet_id = module.network.subnet_1_id

  security_group_id = module.network.security_group_id

  instance_name = local.instance_name
  key_name      = "web-instance-key"

}
module "network_dev" {
  source              = "./modules/network"
  vpc_cidr            = "10.1.0.0/16"
  subnet_1_cidr       = "10.1.10.0/24"
  subnet_2_cidr       = "10.1.2.0/24"
  az_1                = "ap-south-1a"
  az_2                = "ap-south-1b"
  security_group_name = "dev-security-group"
  route_table_name    = "dev-route-table"
  igw_name            = "dev-igw"
  vpc_name            = "dev-vpc"
}
module "compute_dev" {
  source            = "./modules/compute"
  ami_id            = local.ami_id
  instance_type     = local.instance_type
  subnet_id         = module.network_dev.subnet_1_id
  security_group_id = module.network_dev.security_group_id
  instance_name     = "dev-instance"
  key_name          = "web-instance-key"
}
module "alb_prod" {
  source = "./modules/alb"
  vpc_id = module.network.vpc_id
  subnet_ids = [module.network.subnet_1_id,
  module.network.subnet_2_id]
  instance_ids            = [module.compute.instance_id]
  alb_name                = "prod-alb"
  target_group_name       = "prod-alb-tg"
  alb_security_group_name = "prod-alb-sg"
}
module "alb_dev" {
  source                  = "./modules/alb"
  vpc_id                  = module.network_dev.vpc_id
  subnet_ids              = [module.network_dev.subnet_1_id, module.network_dev.subnet_2_id]
  instance_ids            = [module.compute_dev.instance_id]
  alb_name                = "dev-alb"
  target_group_name       = "dev-alb-tg"
  alb_security_group_name = "dev-alb-sg"

}