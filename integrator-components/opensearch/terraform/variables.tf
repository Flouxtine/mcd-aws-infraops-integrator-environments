variable "global" {
  type        = any
  description = "Global parameters"
}


variable "create_opensearch_config" {
  type        = map(any)
  description = "Create opensearch configuration parameters"
}