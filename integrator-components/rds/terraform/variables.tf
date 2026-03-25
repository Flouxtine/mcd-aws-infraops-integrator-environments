variable "global" {
  default     = {}
  description = "Global config"
}

variable "create_rds_config" {
  type        = any
  description = "The config of create aws rds"
}