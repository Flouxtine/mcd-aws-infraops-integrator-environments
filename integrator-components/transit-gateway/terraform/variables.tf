variable "global" {
  type        = any
  description = "Global param"
  default     = "{}"
}
variable "create_resource_config" {
  type = map(object({
    create_aws_ec2_transit_gateway  = optional(bool, false)
    amazon_side_asn                 = optional(number, null)
    auto_accept_shared_attachments  = optional(string, null)
    default_route_table_association = optional(string, null)
    default_route_table_propagation = optional(string, null)
    description                     = optional(string, null)
    dns_support                     = optional(string, null)
    multicast_support               = optional(string, null)
    transit_gateway_cidr_blocks     = optional(list(string), [])
    tags                            = optional(map(string), {})
    vpn_ecmp_support                = optional(string, null)
    aws_ec2_transit_gateway_connect_config = optional(map(object({
      transport_attachment_id = optional(string)
      transit_gateway_id      = optional(string)
      tags                    = optional(map(string), {})
    })), {})

    aws_ec2_transit_gateway_connect_peer_config = optional(map(object({
      inside_cidr_blocks            = optional(list(string))
      peer_address                  = optional(string)
      transit_gateway_attachment_id = optional(string)
      bgp_asn                       = optional(string, null)
      tags                          = optional(map(string), {})
      transit_gateway_address       = optional(string, null)
    })), {})

    aws_ec2_transit_gateway_vpc_attachment_config = optional(map(object({
      subnet_ids                                      = optional(list(string))
      transit_gateway_id                              = optional(string)
      vpc_id                                          = optional(string)
      appliance_mode_support                          = optional(string, null)
      dns_support                                     = optional(string, null)
      ipv6_support                                    = optional(string, null)
      security_group_referencing_support              = optional(string, null)
      tags                                            = optional(map(string), {})
      transit_gateway_default_route_table_association = optional(bool, null)
      transit_gateway_default_route_table_propagation = optional(bool, null)
    })), {})

    aws_ec2_transit_gateway_vpc_attachment_accepter_config = optional(map(object({
      transit_gateway_attachment_id                   = optional(string)
      tags                                            = optional(map(string), {})
      transit_gateway_default_route_table_association = optional(bool, null)
      transit_gateway_default_route_table_propagation = optional(bool, null)
    })), {})

  }))

  default     = {}
  description = "Create resource configuration for aws_ec2_transit_gateway,aws_ec2_transit_gateway_connect,aws_ec2_transit_gateway_connect_peer,aws_ec2_transit_gateway_vpc_attachment,aws_ec2_transit_gateway_vpc_attachment_accepter,"
}

