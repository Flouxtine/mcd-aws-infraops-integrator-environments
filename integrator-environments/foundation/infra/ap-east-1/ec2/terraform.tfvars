create_ec2_config = {
  aws-foundation-infra-ec2-nexus-01 = {
    create    = true
    name      = "aws-foundation-infra-ec2-nexus-01",
    subnet_id = "subnet-03a0dea2a528c3bb6",
    ami       = "ami-07f4eb0de47645a11"
    instance_type = "c6a.xlarge"
    source_dest_check = true
    metadata_options = {
      http_put_response_hop_limit = 2
      http_tokens                 = "required"
    }
    tags = {
      "Name" = "aws-foundation-infra-ec2-nexus-01"
    }
    # volume_tags = {
    #   "Name" = "aws-wukong-sit-ec2-nat-01"
    # }
  }
}