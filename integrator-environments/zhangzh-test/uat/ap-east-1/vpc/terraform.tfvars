# VPC 配置
create_aws_vpc_config = {
  "main" = {
    create_aws_vpc                       = true
    cidr_block                           = "10.0.0.0/16"
    assign_generated_ipv6_cidr_block     = false
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    instance_tenancy                     = "default"
    tags = {
      Name        = "main-vpc"
      Environment = "dev"
    }
  }
}

# 子网配置
create_aws_subnet_config = {
  # 公网子网（可用区 a）
  "public_1" = {
    create_aws_subnet       = true
    vpc_id_depend_key       = "main"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "ap-east-1a"
    map_public_ip_on_launch = true
    tags = {
      Name = "public-subnet-1"
      Type = "public"
    }
  }
  # 公网子网（可用区 b）
  "public_2" = {
    create_aws_subnet       = true
    vpc_id_depend_key       = "main"
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "ap-east-1b"
    map_public_ip_on_launch = true
    tags = {
      Name = "public-subnet-2"
      Type = "public"
    }
  }
  # 私网子网（可用区 a）
  "private_1" = {
    create_aws_subnet       = true
    vpc_id_depend_key       = "main"
    cidr_block              = "10.0.3.0/24"
    availability_zone       = "ap-east-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "private-subnet-1"
      Type = "private"
    }
  }
  # 私网子网（可用区 b）
  "private_2" = {
    create_aws_subnet       = true
    vpc_id_depend_key       = "main"
    cidr_block              = "10.0.4.0/24"
    availability_zone       = "ap-east-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "private-subnet-2"
      Type = "private"
    }
  }
}

# 路由表配置
create_aws_route_table_config = {
  # 公网路由表
  "public" = {
    create_aws_route_table = true
    vpc_id_depend_key      = "main"
    tags = {
      Name = "public-rt"
    }
  }
  # 私网路由表
  "private" = {
    create_aws_route_table = true
    vpc_id_depend_key      = "main"
    tags = {
      Name = "private-rt"
    }
  }
}

# 路由配置（公网路由表添加默认路由到 Internet Gateway）
# create_aws_route_config = {
#   "public_internet" = {
#     create_aws_route          = true
#     route_table_id_depend_key = "public"
#     destination_cidr_block    = "0.0.0.0/0"
#     # 替换为实际的 Internet Gateway ID（需提前创建）
#     gateway_id = "igw-xxxxxxxx"
#   }
# }

# 路由表关联（将子网绑定到对应的路由表）
create_aws_route_table_association_config = {
  # 公网子网关联到公网路由表
  "public_1_assoc" = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "public"
    subnet_id_depend_key               = "public_1"
  }
  "public_2_assoc" = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "public"
    subnet_id_depend_key               = "public_2"
  }
  # 私网子网关联到私网路由表
  "private_1_assoc" = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "private"
    subnet_id_depend_key               = "private_1"
  }
  "private_2_assoc" = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "private"
    subnet_id_depend_key               = "private_2"
  }
}
