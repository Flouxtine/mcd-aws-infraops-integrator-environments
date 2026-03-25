create_aws_launch_template_config = {
  eksctl-aws-uat-3poeks-01-nodegroup-nodegroup01 = {
    create_aws_launch_template 	=  	true
    name                                  	=  	"eksctl-aws-uat-3poeks-01-nodegroup-nodegroup01"
    region                                	=  	"ap-east-1"
    key_name                              	=  	"aws-3poeks-uat-key-eks-01"
    block_device_mappings = [{
      device_name = "/dev/xvda"
      ebs = [{
        encrypted             = "true"
        iops                  = 2000
        throughput            = 125
        volume_size           = 200
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