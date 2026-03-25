variable "global" {
  type        = any
  description = "Global param"
  default     = "{}"
}
variable "create_resource_config" {
  type = map(object({
    create_aws_dx_gateway = optional(bool, false)
    name                  = string
    amazon_side_asn       = string
    tags                  = optional(map(string), {})
    aws_dx_private_virtual_interface_config = optional(map(object({
      connection_id    = optional(string)
      name             = optional(string)
      vlan             = optional(number)
      address_family   = optional(string)
      bgp_asn          = optional(number)
      amazon_address   = optional(string, null)
      bgp_auth_key     = optional(string, null)
      customer_address = optional(string, null)
      dx_gateway_id    = optional(string, null)
      mtu              = optional(number, null)
      tags             = optional(map(string), {})
      vpn_gateway_id   = optional(string, null)
    })), {})

    aws_dx_transit_virtual_interface_config = optional(map(object({
      connection_id    = string
      name             = string
      vlan             = number
      address_family   = string
      bgp_asn          = number
      dx_gateway_id    = string
      amazon_address   = optional(string, null)
      bgp_auth_key     = optional(string, null)
      customer_address = optional(string, null)
      sitelink_enabled = optional(string, null)
      mtu              = optional(number, null)
      tags             = optional(map(string), {})
    })), {})

    aws_dx_gateway_association_config = optional(map(object({
      dx_gateway_id                       = optional(string)
      allowed_prefixes                    = optional(list(string), [])
      associated_gateway_id               = optional(string, null)
      associated_gateway_owner_account_id = optional(string, null)
      proposal_id                         = optional(string, null)
    })), {})

    aws_dx_gateway_association_proposal_config = optional(map(object({
      dx_gateway_id               = optional(string)
      dx_gateway_owner_account_id = optional(string)
      associated_gateway_id       = optional(string)
      allowed_prefixes            = optional(list(string), [])
    })), {})

    aws_dx_connection_config = optional(map(object({
      bandwidth       = optional(string)
      location        = optional(string)
      name            = optional(string)
      encryption_mode = optional(string, null)
      provider_name   = optional(string, null)
      request_macsec  = optional(bool, null)
      skip_destroy    = optional(bool, null)
      tags            = optional(map(string), {})
    })), {})

  }))

  default     = {}
  description = "Create resource configuration for aws_dx_gateway,aws_dx_private_virtual_interface,aws_dx_transit_virtual_interface,aws_dx_gateway_association,aws_dx_gateway_association_proposal,aws_dx_connection,"
}

