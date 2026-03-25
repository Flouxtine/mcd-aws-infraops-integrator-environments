create_aws_launch_template_config = {
  eksctl-aws-bossfoundation-dev-eks-01-nodegroup-nodegroup01 = {
    create_aws_launch_template = true
    name                       = "eksctl-aws-bossfoundation-dev-eks-01-nodegroup-nodegroup01"
    region                     = "ap-east-1"
    key_name                   = "aws-bossfoundation-dev-key-eks-01"
    block_device_mappings = [
      {
        device_name = "/dev/xvda"
        ebs = [
          {
            encrypted   = "true"
            iops        = 2000
            throughput  = 125
            volume_size = 200
            volume_type = "gp3"
          }
        ]
      }
    ]
    metadata_options = [
      {
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
      },
    ]
    tag_specifications = [
      {
        resource_type = "instance"
        tags = {
          Name          = "aws-bossfoundation-dev-eks-01-nodegroup"
          "Mcd-Project" = "bossfoundation"
        }
      },
      {
        resource_type = "volume"
        tags = {
          "Mcd-Project" = "bossfoundation"
        }
      }
    ]

  }
}