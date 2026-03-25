create_ec2_config = {
  aws-wukong-sit-ec2-nat-01 = {
    create    = true
    name      = "aws-wukong-sit-ec2-nat-01",
    subnet_id = "subnet-03a0dea2a528c3bb6",
    ami       = "ami-0c68e76dd761b1ba7"
    instance_type = "c6i.large"

    source_dest_check = false
    metadata_options = {
      http_put_response_hop_limit = 2
      http_tokens                 = "required"
    }
    tags = {
      "Name" = "aws-wukong-sit-ec2-nat-01"
    }
    # volume_tags = {
    #   "Name" = "aws-wukong-sit-ec2-nat-01"
    # }
  }
}