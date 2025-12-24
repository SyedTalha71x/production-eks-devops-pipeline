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


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
}

variable "capacity_type" {
  description = "Capacity type for worker nodes (ON_DEMAND or SPOT)"
  type        = string 
}

variable "disk_size" {
  description = "Disk size for worker nodes in GB"
  type        = number
}

variable "node_labels" {
  description = "Labels to apply to worker nodes"
  type        = map(string)
  
}

