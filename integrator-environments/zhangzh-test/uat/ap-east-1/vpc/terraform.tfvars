create_aws_vpc_config = {
  zhangzh-vpc-uat-ap-east-1 = {
    create_aws_vpc       = true
    name                 = "zhangzh-test-uat-ap-east-1"
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
      "Name" = "zhangzh-test-uat-ap-east-1"
    }
  }
  zhangzh-subnet-uat-ap-east-1a = {
    create_aws_subnet       = true
    name                    = "zhangzh-subnet-uat-ap-east-1a"
    vpc_id_depend_key       = "zhangzh-vpc-uat-ap-east-1"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "ap-east-1a"
    map_public_ip_on_launch = true
    tags = {
      "Name" = "zhangzh-subnet-uat-ap-east-1a"
    }
  }
  zhangzh-subnet-uat-ap-east-1b = {
    create_aws_subnet       = true
    name                    = "zhangzh-subnet-uat-ap-east-1b"
    vpc_id_depend_key       = "zhangzh-vpc-uat-ap-east-1"
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "ap-east-1b"
    map_public_ip_on_launch = true
    tags = {
      "Name" = "zhangzh-subnet-uat-ap-east-1b"
    }
  }
  zhangzh-route-table-uat-ap-east-1 = {
    create_aws_route_table = true
    name                   = "zhangzh-route-table-uat-ap-east-1"
    vpc_id_depend_key      = "zhangzh-vpc-uat-ap-east-1"
    route = [
      {
        destination_cidr_block = "0.0.0.0/0"
      }
    ]
  }
}
