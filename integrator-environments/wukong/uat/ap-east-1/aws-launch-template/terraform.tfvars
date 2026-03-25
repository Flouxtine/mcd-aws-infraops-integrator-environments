create_aws_launch_template_config = {
  eksctl-aws-wukong-uat-eks-01-nodegroup-nodegroup01 = {
    create_aws_launch_template 	=  	true
    name                                  	=  	"eksctl-aws-wukong-uat-eks-01-nodegroup-nodegroup01"
    region                                	=  	"ap-east-1"
    key_name                              	=  	"aws-wukong-sit-key-eks-01"
    block_device_mappings = [{
      device_name = "/dev/xvda"
      ebs = [{
        encrypted             = "true"
        iops                  = 3000
        throughput            = 125
        volume_size           = 300
        volume_type           = "gp3"
      }]
    }]
    metadata_options                     = [{
      http_put_response_hop_limit = 2
      http_tokens                 = "required"
},
]

}
}