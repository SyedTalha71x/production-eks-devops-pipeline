output "cluster_security_group_id" {
  description = "Security group ID for cluster"
  value       = aws_security_group.cluster.id
}

output "kms_key_arn" {
  description = "KMS key ARN"
  value       = var.enable_kms_encryption ? aws_kms_key.eks[0].arn : null
}

output "kms_key_id" {
  description = "KMS key ID"
  value       = var.enable_kms_encryption ? aws_kms_key.eks[0].id : null
}