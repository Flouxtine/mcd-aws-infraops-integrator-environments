#variables.tf
variable "global" {
  description = "Global configuration"
  type = object({
    regions = map(string)
  })
  default = null
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-east-1"
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to destroy the bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode: PROVISIONED or PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "Read capacity units (required if billing_mode = PROVISIONED)"
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "Write capacity units (required if billing_mode = PROVISIONED)"
  type        = number
  default     = null
}

variable "hash_key" {
  description = "Hash key (partition key) for the table"
  type        = string
}

variable "range_key" {
  description = "Range key (sort key) for the table (optional)"
  type        = string
  default     = null
}

variable "attributes" {
  description = "List of attribute definitions for the table"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "ttl_attribute_name" {
  description = "Attribute name for TTL"
  type        = string
  default     = null
}

variable "ttl_enabled" {
  description = "Enable TTL on the table"
  type        = bool
  default     = false
}

variable "pitr_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = false
}

variable "server_side_encryption_enabled" {
  description = "Enable server-side encryption for the table"
  type        = bool
  default     = true
}

variable "stream_enabled" {
  description = "Enable DynamoDB Streams"
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "Stream view type: KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES"
  type        = string
  default     = null
}
