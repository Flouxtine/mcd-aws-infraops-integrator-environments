
variable "global" {
  default     = {}
  description = "Global config"
}

variable "create_elasticache_map" {
  type = map(object({
    create                      = bool
    create_replication_group    = bool
    replication_group_id        = string
    engine_version              = optional(string)
    num_cache_clusters          = optional(number)
    multi_az_enabled            = optional(bool)
    cluster_mode                = optional(string)
    num_cache_nodes             = optional(number)
    cluster_mode_enabled        = optional(bool)
    replicas_per_node_group     = optional(number)
    auth_token                  = optional(string)
    auto_minor_version_upgrade  = optional(bool)
    snapshot_retention_limit    = optional(number)
    security_group_ids          = optional(list(string))
    node_type                   = optional(string)
    description                 = optional(string)
    auth_token_update_strategy  = optional(string)
    subnet_group_name           = optional(string)
    create_subnet_group         = bool
    subnet_group_description    = optional(string)
    subnet_ids                  = optional(list(string))
    create_parameter_group      = optional(bool)
    parameter_group_name        = optional(string)
    parameter_group_description = optional(string)
    parameter_group_family      = optional(string)
    parameters                  = optional(list(any))
    transit_encryption_enabled  = optional(bool)
  }))
  default     = {}
  description = "The argument of create elasticache config"
}
