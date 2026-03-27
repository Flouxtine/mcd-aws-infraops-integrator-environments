create_aws_security_group_config = {
  aws-stg-dmz-temp-sg-01 = {
    # SG ID: sg-0ed37fec45165d11b (existing)
    # Keep this disabled to avoid creating duplicate SG.
    create_aws_security_group = false
    name                      = "aws-stg-dmz-temp-sg-01"
    description               = "Temporary SG for STG DMZ access control"
    vpc_id                    = null
    tags = {
      Name = "aws-stg-dmz-temp-sg-01"
    }
  }
}

create_aws_security_group_rule_config = {
  aws-stg-dmz-temp-sg-01-ingress-dmz = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.40.0/26"]
    description                    = "allow all from aws-stg-dmz-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-infra = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.40.64/26"]
    description                    = "allow all from aws-stg-infra-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-devops = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.40.128/26"]
    description                    = "allow all from aws-stg-devops-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-wukongboss = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["152.141.173.0/25"]
    description                    = "allow all from aws-stg-wukongboss-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-3po = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.1.0/24"]
    description                    = "allow all from aws-stg-3po-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-shared = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.2.0/24"]
    description                    = "allow all from aws-stg-shared-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-wukong = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["152.141.173.128/26"]
    description                    = "allow all from aws-stg-wukong-vpc-01"
  }
  aws-stg-dmz-temp-sg-01-ingress-directconnect = {
    create_aws_security_group_rule = true
    type                           = "ingress"
    protocol                       = "-1"
    from_port                      = 0
    to_port                        = 0
    security_group_id              = "sg-0ed37fec45165d11b"
    cidr_blocks                    = ["192.168.45.0/26"]
    description                    = "allow all from aws-stg-directconnect-vpc-01"
  }
}