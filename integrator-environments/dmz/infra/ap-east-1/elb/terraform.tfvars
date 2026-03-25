create_lb_config = {
  aws-dmz-infra-elb-foundation-01 = {
    load_balancer_name = "aws-foundation-infra-elb-01"
    load_balancer_type = "network"
    ip_address_type    = "ipv4"
    internal           = "false"
    enable_cross_zone_load_balancing = true
    security_groups    = ["sg-04bf65ee36f1c6d44"]
    subnet_mappings = [
      {
        subnet_id = "subnet-01e22169d240a9559"
      },
      {
        subnet_id = "subnet-002a087f2dc513ded"
      },
      {
        subnet_id = "subnet-0f664ddfe2c824475"
      }
    ]
    access_logs = {
      enabled = true
    }
  }
}

create_lb_listener_config = {
  listener-80 = {
    port                            = 80
    protocol                        = "TCP"
    load_balancer_name              = "aws-dmz-infra-elb-foundation-01"
    default_action_type             = "forward"
    default_action_target_group_name = "aws-foundation-infra-target-01"
    default_action_forward = {
      target_groups = [{
        arn    = "arn:aws:elasticloadbalancing:ap-east-1:863518445962:targetgroup/aws-foundation-infra-target-01/6d5a613f1fdefc4d"
        weight = 0
      }],
      stickiness = {
      }
    }
  }
  listener-443 = {
    port                            = 443
    protocol                        = "TCP"
    load_balancer_name              = "aws-dmz-infra-elb-foundation-01"
    default_action_type             = "forward"
    default_action_target_group_name = "aws-foundation-infra-target-02"
    default_action_forward = {
      target_groups = [{
        arn    = "arn:aws:elasticloadbalancing:ap-east-1:863518445962:targetgroup/aws-foundation-infra-target-02/a8057ad51b69521f"
        weight = 0
      }],
      stickiness = {
      }
    }
  }
}

create_lb_target_group_config = {
  aws-foundation-infra-target-01 = {
    name            = "aws-foundation-infra-target-01"
    port            = 80
    protocol        = "TCP"
    target_type     = "ip"
    ip_address_type = "ipv4"
    vpc_id          = "vpc-0823081c6bb4b47ef"
    health_check = {
      enabled             = true
      healthy_threshold   = 5
      interval            = 30
      port                = "traffic-port"
      protocol            = "TCP"
      timeout             = 10
      unhealthy_threshold = 2
    }
    # attachments = [
    #   {
    #     target_id = "10.126.250.140"
    #     port = 80
    #   } ,
    #   {
    #     target_id = "10.126.250.229"
    #     port = 80
    #   }
    # ]
  },
  aws-foundation-infra-target-02 = {
    name            = "aws-foundation-infra-target-02"
    port            = 443
    protocol        = "TCP"
    target_type     = "ip"
    ip_address_type = "ipv4"
    vpc_id          = "vpc-0823081c6bb4b47ef"
    health_check = {
      enabled             = true
      healthy_threshold   = 5
      interval            = 30
      port                = "traffic-port"
      protocol            = "TCP"
      timeout             = 10
      unhealthy_threshold = 2
    }
    # attachments = [
    #   {
    #     target_id = "10.126.250.140"
    #     port = 443
    #   } ,
    #   {
    #     target_id = "10.126.250.229"
    #     port = 443
    #   }
    # ]
  }
}