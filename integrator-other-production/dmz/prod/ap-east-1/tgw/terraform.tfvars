create_resource_config = {
  aws-prod-infra-tgw-01 = {
    create_aws_ec2_transit_gateway  = false
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"
    dns_support                     = "enable"
    tags = {
      Name = "aws-prod-infra-tgw-01"
    }

    # TGW Route Table: aws-prod-infra-tgwrt-dmz
    aws_ec2_transit_gateway_route_table_config = {
      aws-prod-infra-tgwrt-dmz = {
        transit_gateway_id = "tgw-068fe4f6ebf61309d"
        tags = {
          Name = "aws-prod-infra-tgwrt-dmz"
        }
      }
    }

    # 关联到该路由表的 Attachment（DMZ VPC + Direct Connect Gateway）
    aws_ec2_transit_gateway_route_table_association_config = {
      aws-prod-dmz-vpc-01-assoc = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-dmz-vpc-01-attachment"
      }
      direct-connect-gateway-assoc = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "Direct Connect Gateway"
      }
    }

    # 传播策略：删除 DMZ 与 IDC 的传播关系，仅保留其余 VPC 的传播
    aws_ec2_transit_gateway_route_table_propagation_config = {
      aws-prod-infra-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-infra-vpc-01-attachment"
      }
      aws-prod-devops-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-devops-vpc-01-attachment"
      }
      aws-prod-shared-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-shared-vpc-01-attachment"
      }
      aws-prod-3po-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-3po-vpc-01-attachment"
      }
      aws-prod-wukongboss-bossfoundation-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-wukongboss+bossfoundation-vpc-01-attachment"
      }
      aws-prod-wukong-vpc-01-prop = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        transit_gateway_attachment_id              = "aws-prod-wukong-vpc-01-attachment"
      }
    }

    # 静态路由
    aws_ec2_transit_gateway_route_config = {
      egress-default = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "0.0.0.0/0"
        transit_gateway_attachment_id             = "aws-prod-dmz-vpc-01-attachment"
      }
      dmz-192-168-47 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.47.0/24"
        transit_gateway_attachment_id             = "aws-prod-dmz-vpc-01-attachment"
      }
      dmz-192-168-5 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.5.0/24"
        transit_gateway_attachment_id             = "aws-prod-dmz-vpc-01-attachment"
      }
      infra-192-168-48 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.48.0/23"
        transit_gateway_attachment_id             = "aws-prod-infra-vpc-01-attachment"
      }
      devops-192-168-50 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.50.0/24"
        transit_gateway_attachment_id             = "aws-prod-devops-vpc-01-attachment"
      }
      shared-192-168-8 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.8.0/23"
        transit_gateway_attachment_id             = "aws-prod-shared-vpc-01-attachment"
      }
      po3-192-168-6 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.6.0/23"
        transit_gateway_attachment_id             = "aws-prod-3po-vpc-01-attachment"
      }
      wukongboss-main = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "152.141.239.0/24"
        transit_gateway_attachment_id             = "aws-prod-wukongboss+bossfoundation-vpc-01-attachment"
      }
      wukongboss-secondary = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.169.1.0/24"
        transit_gateway_attachment_id             = "aws-prod-wukongboss+bossfoundation-vpc-01-attachment"
      }
      wukong-main = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "152.141.240.0/25"
        transit_gateway_attachment_id             = "aws-prod-wukong-vpc-01-attachment"
      }
      wukong-secondary = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.169.2.0/24"
        transit_gateway_attachment_id             = "aws-prod-wukong-vpc-01-attachment"
      }
      idc-10-8 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "10.0.0.0/8"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-100-8 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "100.0.0.0/8"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-142-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "142.11.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-152-140-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "152.140.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-152-141-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "152.141.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-152-142-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "152.142.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-172-12 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "172.16.0.0/12"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-192-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-192-168-45-80-28 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "192.168.45.80/28"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-66-16 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "66.111.0.0/16"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-10-68-253-24 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "10.68.253.0/24"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
      idc-10-252-6-196-30 = {
        transit_gateway_route_table_id_depend_key = "aws-prod-infra-tgwrt-dmz"
        destination_cidr_block                    = "10.252.6.196/30"
        transit_gateway_attachment_id             = "Direct Connect Gateway"
      }
    }
  }
}