module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.main_vpc_cidr
  subnet_1_cidr       = var.main_subnet_1_cidr
  subnet_1_name       = var.main_subnet_1_name
  subnet_2_name       = var.main_subnet_2_name
  subnet_2_cidr       = var.main_subnet_2_cidr
  az_1                = var.main_az_1
  az_2                = var.main_az_2
  security_group_name = var.main_security_group_name
  route_table_name    = var.main_route_table_name

  igw_name                 = var.main_igw_name
  vpc_name                 = var.main_vpc_name
  db_subnet_name           = var.db_subnet_name
  db_subnet_cidr           = var.db_subnet_cidr
  db_subnet_az             = var.db_subnet_az
  private_route_table_name = var.main_private_route_table_name

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
  source = "./modules/network"

  vpc_cidr            = var.dev_vpc_cidr
  subnet_1_cidr       = var.dev_subnet_1_cidr
  subnet_1_name       = var.dev_subnet_1_name
  subnet_2_name       = var.dev_subnet_2_name
  subnet_2_cidr       = var.dev_subnet_2_cidr
  az_1                = var.dev_az_1
  az_2                = var.dev_az_2
  security_group_name = var.dev_security_group_name
  route_table_name    = var.dev_route_table_name
  igw_name            = var.dev_igw_name
  vpc_name            = var.dev_vpc_name
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