module "network" {
  source   = "./modules/network"
  vpc_cidr = "10.0.0.0/16"

  subnet_cidr = "10.0.1.0/24"

  subnet_name = "web-subnet"

  security_group_name = "web-sg"

  route_table_name = "web-rt"

  igw_name = "web-igw"

  vpc_name = "main-vpc"

}

locals {

  ami_id = "ami-0eef9d717347382c1"

}

module "compute" {

  source = "./modules/compute"

  ami_id = local.ami_id

  instance_type = var.instance_type

  subnet_id = module.network.subnet_id

  security_group_id = module.network.security_group_id

  instance_name = var.instance_name

}
module "network_dev" {
  source              = "./modules/network"
  vpc_cidr            = "10.1.0.0/16"
  subnet_cidr         = "10.1.1.0/24"
  subnet_name         = "dev-subnet"
  security_group_name = "dev-security-group"
  route_table_name    = "dev-route-table"
  igw_name            = "dev-igw"
  vpc_name            = "dev-vpc"
}
module "compute_dev" {
  source            = "./modules/compute"
  ami_id            = local.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network_dev.subnet_id
  security_group_id = module.network_dev.security_group_id
  instance_name     = "dev-instance"
}