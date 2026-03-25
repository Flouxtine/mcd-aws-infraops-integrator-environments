create_natgw_config = {
  aws-dmz-infra-nat-pub-1c-01 = {

    name              = "aws-dmz-infra-nat-pub-1c-01"
    connectivity_type = "public"
    subnet_id         = "subnet-01e22169d240a9559"
    allocation_id     = "eipalloc-02fc44951b4b0f74f"
    tags = {
      "Name" = "aws-dmz-infra-nat-pub-1c-01"
    }
  },
  aws-dmz-infra-nat-pub-1b-01 = {

    name              = "aws-dmz-infra-nat-pub-1b-01"
    connectivity_type = "public"
    subnet_id         = "subnet-0f664ddfe2c824475"
    allocation_id     = "eipalloc-0352c113c3fe3c5ca"
    tags = {
      "Name" = "aws-dmz-infra-nat-pub-1b-01"
    }
  },
  aws-dmz-infra-nat-pub-1a-01 = {

    name              = "aws-dmz-infra-nat-pub-1a-01"
    connectivity_type = "public"
    subnet_id         = "subnet-002a087f2dc513ded"
    allocation_id     = "eipalloc-048730a87878164c5"
    tags = {
      "Name" = "aws-dmz-infra-nat-pub-1a-01"
    }
  }
}