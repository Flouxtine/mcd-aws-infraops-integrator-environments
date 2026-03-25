variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_terraform-aws-dynamodb_config" {
  description = "create resource terraform-aws-dynamodb all params"
  default     = {}
  type = map(object({
    create_aws_dynamodb_table   = optional(bool, false)
    name                        = optional(string, null)
    hash_key                    = optional(string, null)
    billing_mode                = optional(string, null)
    read_capacity               = optional(number, null)
    write_capacity              = optional(number, null)
    stream_enabled              = optional(bool, null)
    stream_view_type            = optional(string, null)
    range_key                   = optional(string, null)
    table_class                 = optional(string, null)
    tags                        = optional(map(string), {})
    deletion_protection_enabled = optional(bool, null)
    restore_date_time           = optional(string, null)
    restore_source_name         = optional(string, null)
    restore_to_latest_time      = optional(string, null)
    attribute                   = optional(map(any), {})
    global_secondary_index      = optional(map(any), {})
    local_secondary_index       = optional(map(any), {})
    point_in_time_recovery      = optional(map(any), {})
    on_demand_throughput        = optional(map(any), {})
    replica                     = optional(map(any), {})
    server_side_encryption      = optional(map(any), {})
    ttl                         = optional(map(any), {})
    import_table                = optional(map(any), {})
    })
  )
}
