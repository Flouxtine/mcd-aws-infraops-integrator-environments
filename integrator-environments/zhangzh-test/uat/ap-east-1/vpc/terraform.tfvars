
# VPC Configuration for UAT Environment in ap-east-1
vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnets = [
  "10.0.10.0/24",
  "10.0.11.0/24",
  "10.0.12.0/24"
]

availability_zones = [
  "ap-east-1a",
  "ap-east-1b",
  "ap-east-1c"
]

enable_nat_gateway     = true
single_nat_gateway     = false
one_nat_gateway_per_az = true

tags = {
  Environment = "uat"
  Project     = "zhangzh-test"
  ManagedBy   = "terraform"
}
