create_ec2_config = {
  aws-prod-dmzbastionhost-01 = {
    create                = true
    name                  = "aws-prod-dmzbastionhost-01"
    instance_type         = "c6i.2xlarge"
    availability_zone     = "ap-east-1a"
    ami_ssm_parameter     = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
    key_name              = "aws-prod-dmzbastionhost-key-01"
    subnet_name           = "aws-prod-dmz-vsw-pub-1a-01"
    vpc_security_group_names = ["aws-prod-dmzbastionhost-sg-01"]
    associate_public_ip_address = true
    root_block_device = [{
      encrypted   = true
      volume_type = "gp3"
      volume_size = 150
    }]
    metadata_options = {
      http_tokens = "required"
    }
    tags = {
      Name        = "aws-prod-dmzbastionhost-01"
      Role        = "bastion host"
      OS          = "ubuntu-noble-24.04"
      Environment = "prod"
    }
  }

  aws-prod-dmzbastionhost-02 = {
    create                = true
    name                  = "aws-prod-dmzbastionhost-02"
    instance_type         = "c6i.2xlarge"
    availability_zone     = "ap-east-1c"
    ami_ssm_parameter     = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
    key_name              = "aws-prod-dmzbastionhost-key-01"
    subnet_name           = "aws-prod-dmz-vsw-pub-1c-01"
    vpc_security_group_names = ["aws-prod-dmzbastionhost-sg-01"]
    associate_public_ip_address = true
    root_block_device = [{
      encrypted   = true
      volume_type = "gp3"
      volume_size = 150
    }]
    metadata_options = {
      http_tokens = "required"
    }
    tags = {
      Name        = "aws-prod-dmzbastionhost-02"
      Role        = "bastion host"
      OS          = "ubuntu-noble-24.04"
      Environment = "prod"
    }
  }

  aws-prod-dmzbastionhost-windows-01 = {
    create                = true
    name                  = "aws-prod-dmzbastionhost-windows-01"
    instance_type         = "c6i.xlarge"
    availability_zone     = "ap-east-1a"
    ami_ssm_parameter     = "/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base"
    key_name              = "aws-prod-dmzbastionhost-windows-key-01"
    subnet_name           = "aws-prod-dmz-vsw-pri-1a-01"
    vpc_security_group_names = ["aws-prod-dmzbastionhost-windows-sg-01"]
    associate_public_ip_address = false
    root_block_device = [{
      encrypted   = true
      volume_type = "gp3"
      volume_size = 100
    }]
    metadata_options = {
      http_tokens = "required"
    }
    tags = {
      Name        = "aws-prod-dmzbastionhost-windows-01"
      Role        = "bastion release"
      OS          = "windows-server-2019"
      Environment = "prod"
    }
  }

  aws-prod-dmzbastionhost-windows-02 = {
    create                = true
    name                  = "aws-prod-dmzbastionhost-windows-02"
    instance_type         = "c6i.xlarge"
    availability_zone     = "ap-east-1c"
    ami_ssm_parameter     = "/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base"
    key_name              = "aws-prod-dmzbastionhost-windows-key-01"
    subnet_name           = "aws-prod-dmz-vsw-pri-1c-01"
    vpc_security_group_names = ["aws-prod-dmzbastionhost-windows-sg-01"]
    associate_public_ip_address = false
    root_block_device = [{
      encrypted   = true
      volume_type = "gp3"
      volume_size = 100
    }]
    metadata_options = {
      http_tokens = "required"
    }
    tags = {
      Name        = "aws-prod-dmzbastionhost-windows-02"
      Role        = "bastion release"
      OS          = "windows-server-2019"
      Environment = "prod"
    }
  }

  aws-prod-dmzbastionhost-alinux-01 = {
    create                = true
    name                  = "aws-prod-dmzbastionhost-alinux-01"
    instance_type         = "t3.medium"
    availability_zone     = "ap-east-1a"
    ami_ssm_parameter     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    key_name              = "aws-prod-dmzbastionhost-alinux-key-01"
    subnet_name           = "aws-prod-dmz-vsw-pri-1b-02"
    vpc_security_group_names = ["aws-prod-dmzbastionhost-alinux-sg-01"]
    associate_public_ip_address = false
    root_block_device = [{
      encrypted   = true
      volume_type = "gp3"
      volume_size = 100
    }]
    metadata_options = {
      http_tokens = "required"
    }
    tags = {
      Name        = "aws-prod-dmzbastionhost-alinux-01"
      Role        = "bastion release"
      OS          = "al2023"
      Environment = "prod"
    }
  }
}