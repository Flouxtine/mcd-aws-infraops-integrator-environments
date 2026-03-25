variable "global" {
  default     = {}
  description = "Global config"
}

variable "create_msk_config" {
  type        = any
  description = "Create MSK configuration parameters"
}