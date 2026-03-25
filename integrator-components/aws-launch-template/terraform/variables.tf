variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_aws_launch_template_config" {
  description = "create resource aws_launch_template all params"
  default     = {}
  type = map(object({
    create_aws_launch_template           = optional(bool, false)
    name                                 = optional(string, null)
    region                               = optional(string, null)
    description                          = optional(string, null)
    default_version                      = optional(string, null)
    update_default_version               = optional(bool, null)
    image_id                             = optional(string, null)
    instance_type                        = optional(string, null)
    key_name                             = optional(string, null)
    user_data                            = optional(string, null)
    security_group_names                 = optional(list(string), [])
    vpc_security_group_ids               = optional(list(string), [])
    tags                                 = optional(map(string), {})
    disable_api_stop                     = optional(bool, null)
    disable_api_termination              = optional(bool, null)
    ebs_optimized                        = optional(bool, null)
    kernel_id                            = optional(string, null)
    ram_disk_id                          = optional(string, null)
    instance_initiated_shutdown_behavior = optional(string, null)
    block_device_mappings                = optional(list(any), [])
    capacity_reservation_specification   = optional(list(any), [])
    cpu_options                          = optional(list(any), [])
    credit_specification                 = optional(list(any), [])
    enclave_options                      = optional(list(any), [])
    hibernation_options                  = optional(list(any), [])
    iam_instance_profile                 = optional(list(any), [])
    instance_requirements                = optional(list(any), [])
    license_specification                = optional(list(any), [])
    maintenance_options                  = optional(list(any), [])
    instance_market_options              = optional(list(any), [])
    metadata_options                     = optional(list(any), [])
    monitoring                           = optional(list(any), [])
    network_interfaces                   = optional(list(any), [])
    placement                            = optional(list(any), [])
    private_dns_name_options             = optional(list(any), [])
    tag_specifications                   = optional(list(any), [])
    })
  )
}
