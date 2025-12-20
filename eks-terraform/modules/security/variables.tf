variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "enable_kms_encryption" {
  description = "Enable KMS encryption"
  type        = bool
}

variable "kms_key_deletion_window" {
  description = "KMS key deletion window in days"
  type        = number
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}