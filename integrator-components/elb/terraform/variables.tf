variable "global" {
  type        = any
  description = "Global configuration parameters."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "ID of the VPC associated with the load balancer."
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs for the load balancer."
}

variable "lb_security_groups" {
  type        = list(string)
  default     = []
  description = "List of security group IDs to associate with the load balancer."
}

variable "create_lb_config" {
  type        = map(any)
  description = ""
}

variable "create_lb_target_group_config" {
  type        = map(any)
  default     = {}
  description = "Configuration map for creating target groups associated with the load balancer."
}

variable "lb_target_group_arn" {
  type        = list(string)
  default     = []
  description = "List of ARNs for existing target groups to associate with the load balancer."
}

variable "target_group_stickiness" {
  type = object({
    enabled  = optional(bool)
    duration = optional(number)
  })
  default     = {}
  description = "Configuration for stickiness settings for target groups."
}

variable "create_lb_listener_certificate_config" {
  type = map(object({
    certificate_arn = string
  }))
  default     = {}
  description = "Configuration for SSL certificates to be used with the load balancer listener."
}

variable "create_lb_listener_config" {
  type    = map(any)
  default = {}
}