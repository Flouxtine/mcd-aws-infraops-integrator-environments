create_resource_config = {
  aws-dmz-infra-tgw-01 = {
    create_aws_ec2_transit_gateway  = true

    default_route_table_association = "enable"
    default_route_table_propagation = "enable"
    dns_support                     = "enable"
    tags                            = {
      "Name": "aws-dmz-infra-tgw-01"
    }
    aws_ec2_transit_gateway_vpc_attachment_config = {
      aws-wukong-sit-tgw-attachvpc-01 = {
        subnet_ids                        = ["subnet-06765c7a7291adbc7","subnet-0335aa7aee0f89bee","subnet-09b36dc779d69696b"]
        transit_gateway_id                = "tgw-068fe4f6ebf61309d"
        vpc_id                            = "vpc-0ae1d5c4300550a78"
        dns_support                       = "enable"
        security_group_referencing_support = "enable"
        tags                              = {
          "Name": "aws-wukong-sit-tgw-attachvpc-01"
        }
      },
      aws-dmz-infra-tgw-attachvpc-01 = {
        subnet_ids                        = ["subnet-0b1b7ae63d9e70bc0","subnet-0d62632a1f615939e","subnet-007be61e78b32ed96"]
        transit_gateway_id                = "tgw-068fe4f6ebf61309d"
        vpc_id                            = "vpc-0823081c6bb4b47ef"
        dns_support                       = "enable"
        security_group_referencing_support = "enable"
        tags                              = {
          "Name": "aws-dmz-infra-tgw-attachvpc-01"
        }
      }
    }
  }

}