
variable "global" {
  type        = any
  description = "Global Parameters"
}

variable "create_eks_config" {
  type = map(object({
    cluster_name                                = string
    cluster_role_arn                            = string
    bootstrap_self_managed_addons               = optional(bool)
    vpc_id                                      = optional(string)
    subnet_ids                                  = list(string)
    tags                                        = optional(map(string))
    enabled_cluster_log_types                   = optional(list(string))
    kubernetes_version                          = optional(string)
    cluster_security_group_ids                  = optional(list(string))
    cluster_endpoint_private_access             = optional(bool)
    cluster_endpoint_public_access              = optional(bool)
    cluster_endpoint_public_access_cidrs        = optional(list(string))
    authentication_mode                         = optional(string)
    bootstrap_cluster_creator_admin_permissions = optional(bool)
    kubernetes_service_ipv4_cidr                = optional(string)
    kubernetes_ip_family                        = optional(string)
    elastic_load_balancing_enabled              = optional(bool)
    encryption_config                           = optional(map(any))
    upgrade_policy                              = optional(map(any))
    outpost_config = optional(object({
      control_plane_instance_type = string
      outpost_arns                = list(string)
    }))
    zonal_shift_config_enable = optional(bool)
    node_groups = optional(map(object({
      node_role_arn   = string
      node_group_name = optional(string)
      subnet_ids      = optional(list(string))
      cluster_name    = optional(string)
      ami_type        = optional(string)
      capacity_type   = optional(string)
      disk_size       = optional(number)
      instance_types  = optional(list(string))
      labels          = optional(map(string))
      release_version = optional(string)
      version         = optional(string)
      remote_access   = optional(any)
      scaling_config = object({
        desired_size = number
        max_size     = number
        min_size     = number
      })
      update_config   = optional(any)
      launch_template = optional(any)
      taint           = optional(any)
      tags            = optional(map(string))
    })))
    addons = optional(map(object({
      version                  = optional(string)
      cluster_name             = optional(string)
      service_account_role_arn = optional(string)
      configuration_values     = optional(string)
      pod_identity_association = optional(map(any))
      tags                     = optional(map(string))
    })))
    access_entries = optional(map(object({
      principal_arn     = string
      type              = optional(string)
      user_name         = optional(string)
      kubernetes_groups = optional(list(string))
      tags              = optional(map(string))
    })))
    access_policy_associations = optional(map(object({
      policy_arn              = string
      principal_arn           = string
      access_scope_type       = string
      access_scope_namespaces = optional(list(string))
    })))
  }))
  default     = {}
  description = ""
}