module "network" {

  source = "./modules/network"

}

locals {

  ami_id = "ami-0eef9d717347382c1"

}

module "compute" {

  source            = "./modules/compute"

  ami_id            = local.ami_id

  instance_type     = var.instance_type

  subnet_id         = module.network.subnet_id

  security_group_id = module.network.security_group_id

  instance_name     = var.instance_name

}