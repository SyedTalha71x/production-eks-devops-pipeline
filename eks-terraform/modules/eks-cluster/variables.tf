variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)  // '0.0.0.0/16' -> example
}

variable "endpoint_private_access" {
  description = "Enable private API endpoint"
  type        = bool
}

variable "endpoint_public_access" {
  description = "Enable public API endpoint"
  type        = bool
}

variable "public_access_cidrs" {
  description = "CIDR blocks for public access"
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Security group ID for cluster"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption"
  type        = string
}

variable "enable_cluster_logging" {
  description = "Enable cluster logging"
  type        = bool
}

variable "cloudwatch_log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "eks_auto_mode_policies" {
  description = "List of IAM policies for Auto Mode"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}