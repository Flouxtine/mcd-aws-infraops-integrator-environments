# VPC Configuration
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "zhangzh-test-vpc"
environment    = "uat"
region         = "ap-east-1"

# Subnet Configuration
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# Route Table Configuration
route_table_name = "zhangzh-test-route-table"
route_table_tags = {
  Environment = "uat"
  Project     = "mcd-aws-infraops-integrator"
  Owner       = "zhangzh"
  ManagedBy   = "terraform"
}
#Route Configuration
route_destination_cidr_block = "0.0.0.0/0"

# Tags
tags = {
  Environment = "uat"
  Project     = "mcd-aws-infraops-integrator"
  Owner       = "zhangzh"
  ManagedBy   = "terraform"
}
