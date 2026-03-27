create_aws_vpc_config = {
  aws-prod-dmz-vpc-01 = {
    create_aws_vpc       = true
    cidr_block           = "192.168.47.0/24"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
      Name = "aws-prod-dmz-vpc-01"
    }
  }
}

create_aws_subnet_config = {
  aws-prod-dmz-vsw-pub-1a-01 = {
    create_aws_subnet = true
    vpc_id_depend_key = "aws-prod-dmz-vpc-01"
    cidr_block        = "192.168.47.0/26"
    availability_zone = "ap-east-1a"
    tags = {
      Name = "aws-prod-dmz-vsw-pub-1a-01"
      Tier = "Public"
    }
  }
  aws-prod-dmz-vsw-pub-1c-01 = {
    create_aws_subnet = true
    vpc_id_depend_key = "aws-prod-dmz-vpc-01"
    cidr_block        = "192.168.47.64/26"
    availability_zone = "ap-east-1c"
    tags = {
      Name = "aws-prod-dmz-vsw-pub-1c-01"
      Tier = "Public"
    }
  }
  aws-prod-dmz-vsw-pri-1a-01 = {
    create_aws_subnet = true
    vpc_id_depend_key = "aws-prod-dmz-vpc-01"
    cidr_block        = "192.168.47.128/26"
    availability_zone = "ap-east-1a"
    tags = {
      Name = "aws-prod-dmz-vsw-pri-1a-01"
      Tier = "Private"
    }
  }
  aws-prod-dmz-vsw-pri-1c-01 = {
    create_aws_subnet = true
    vpc_id_depend_key = "aws-prod-dmz-vpc-01"
    cidr_block        = "192.168.47.192/26"
    availability_zone = "ap-east-1c"
    tags = {
      Name = "aws-prod-dmz-vsw-pri-1c-01"
      Tier = "Private"
    }
  }
}
create_aws_route_table_config = {
  aws-prod-dmz-rt-pub-01 = {
    create_aws_route_table = true
    vpc_id_depend_key      = "aws-prod-dmz-vpc-01"
    tags = {
      Name = "aws-prod-dmz-rt-pub-01"
      Tier = "Public"
    }
  }
  aws-prod-dmz-rt-pri-01 = {
    create_aws_route_table = true
    vpc_id_depend_key      = "aws-prod-dmz-vpc-01"
    tags = {
      Name = "aws-prod-dmz-rt-pri-01"
      Tier = "Private"
    }
  }
  aws-prod-dmz-rt-pri-02 = {
    create_aws_route_table = true
    vpc_id_depend_key      = "aws-prod-dmz-vpc-01"
    tags = {
      Name = "aws-prod-dmz-rt-pri-02"
      Tier = "Private"
    }
  }
  aws-prod-dmz-rt-pri-03 = {
    create_aws_route_table = true
    vpc_id_depend_key      = "aws-prod-dmz-vpc-01"
    tags = {
      Name = "aws-prod-dmz-rt-pri-03"
      Tier = "Private"
    }
  }
}

create_aws_route_table_association_config = {
  assoc-pub-1a-01 = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "aws-prod-dmz-rt-pub-01"
    subnet_id_depend_key               = "aws-prod-dmz-vsw-pub-1a-01"
    region                             = "ap-east-1"
  }
  assoc-pub-1c-01 = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "aws-prod-dmz-rt-pub-01"
    subnet_id_depend_key               = "aws-prod-dmz-vsw-pub-1c-01"
    region                             = "ap-east-1"
  }
  assoc-pri-1a-01 = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "aws-prod-dmz-rt-pri-01"
    subnet_id_depend_key               = "aws-prod-dmz-vsw-pri-1a-01"
    region                             = "ap-east-1"
  }
  assoc-pri-1c-01 = {
    create_aws_route_table_association = true
    route_table_id_depend_key          = "aws-prod-dmz-rt-pri-02"
    subnet_id_depend_key               = "aws-prod-dmz-vsw-pri-1c-01"
    region                             = "ap-east-1"
  }
}
