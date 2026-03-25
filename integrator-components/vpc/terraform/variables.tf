variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_aws_vpc_config" {
  description = "create resource aws_vpc all params"
  default     = {}
  type = map(object({
    create_aws_vpc                       = optional(bool, false)
    cidr_block                           = optional(string, null)
    assign_generated_ipv6_cidr_block     = optional(bool, null)
    enable_dns_hostnames                 = optional(bool, null)
    enable_dns_support                   = optional(bool, null)
    enable_network_address_usage_metrics = optional(bool, null)
    instance_tenancy                     = optional(string, null)
    ipv4_ipam_pool_id                    = optional(string, null)
    ipv4_netmask_length                  = optional(number, null)
    ipv6_cidr_block                      = optional(string, null)
    ipv6_ipam_pool_id                    = optional(string, null)
    ipv6_netmask_length                  = optional(number, null)
    tags                                 = optional(map(string), {})
    })
  )
}
variable "create_aws_subnet_config" {
  description = "create resource aws_subnet all params"
  default     = {}
  type = map(object({
    create_aws_subnet                              = optional(bool, false)
    vpc_id_depend_key                              = optional(string, null)
    vpc_id                                         = optional(string, null)
    cidr_block                                     = optional(string, null)
    assign_ipv6_address_on_creation                = optional(bool, null)
    availability_zone                              = optional(string, null)
    availability_zone_id                           = optional(string, null)
    enable_dns64                                   = optional(bool, null)
    enable_lni_at_device_index                     = optional(number, null)
    enable_resource_name_dns_aaaa_record_on_launch = optional(bool, null)
    enable_resource_name_dns_a_record_on_launch    = optional(bool, null)
    ipv6_cidr_block                                = optional(string, null)
    ipv6_native                                    = optional(bool, null)
    map_public_ip_on_launch                        = optional(bool, null)
    private_dns_hostname_type_on_launch            = optional(string, null)
    tags                                           = optional(map(string), {})
    })
  )
}
variable "create_aws_route_table_config" {
  description = "create resource aws_route_table all params"
  default     = {}
  type = map(object({
    create_aws_route_table = optional(bool, false)
    vpc_id_depend_key      = optional(string, null)
    vpc_id                 = optional(string, null)
    propagating_vgws       = optional(list(string), [])
    tags                   = optional(map(string), {})
    route                  = optional(list(any), [])
    })
  )
}
variable "create_aws_route_config" {
  description = "create resource aws_route all params"
  default     = {}
  type = map(object({
    create_aws_route            = optional(bool, false)
    route_table_id_depend_key   = optional(string, null)
    route_table_id              = optional(string, null)
    carrier_gateway_id          = optional(string, null)
    core_network_arn            = optional(string, null)
    destination_cidr_block      = optional(string, null)
    destination_ipv6_cidr_block = optional(string, null)
    destination_prefix_list_id  = optional(string, null)
    egress_only_gateway_id      = optional(string, null)
    gateway_id                  = optional(string, null)
    local_gateway_id            = optional(string, null)
    nat_gateway_id              = optional(string, null)
    network_interface_id        = optional(string, null)
    transit_gateway_id          = optional(string, null)
    vpc_endpoint_id             = optional(string, null)
    vpc_peering_connection_id   = optional(string, null)
    })
  )
}
variable "create_aws_route_table_association_config" {
  description = "create resource aws_route_table_association all params"
  default     = {}
  type = map(object({
    create_aws_route_table_association = optional(bool, false)
    route_table_id_depend_key          = optional(string, null)
    route_table_id                     = optional(string, null)
    region                             = optional(string, null)
    subnet_id_depend_key               = optional(string, null)
    subnet_id                          = optional(string, null)
    gateway_id                         = optional(string, null)
    })
  )
}
