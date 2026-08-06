# DB
db_subnet_name = "db-subnet"
db_subnet_cidr = "10.0.3.0/24"
db_subnet_az   = "ap-south-1a"

# Main
main_vpc_name = "main-vpc"
main_vpc_cidr = "10.0.0.0/16"

main_subnet_1_name = "main-public-subnet"
main_subnet_1_cidr = "10.0.10.0/24"

main_subnet_2_name = "main-private-subnet"
main_subnet_2_cidr = "10.0.20.0/24"

main_az_1 = "ap-south-1a"
main_az_2 = "ap-south-1b"

main_igw_name            = "main-igw"
main_route_table_name    = "main-route-table"
main_security_group_name = "web-sg"

# Dev
dev_vpc_name = "dev-vpc"
dev_vpc_cidr = "10.1.0.0/16"

dev_subnet_1_name = "dev-public-subnet"
dev_subnet_1_cidr = "10.1.10.0/24"

dev_subnet_2_name = "dev-private-subnet"
dev_subnet_2_cidr = "10.1.2.0/24"

dev_az_1 = "ap-south-1a"
dev_az_2 = "ap-south-1b"

dev_igw_name                  = "dev-igw"
dev_route_table_name          = "dev-route-table"
dev_security_group_name       = "dev-security-group"
main_private_route_table_name = "main-private-route-table"
iam_role_name = "app-role" 
iam_role_name_db = "db-role"
    