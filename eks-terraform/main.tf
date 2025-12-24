provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

module "security" {
  source = "./modules/security"

  cluster_name               = local.cluster_name
  vpc_id                     = data.aws_vpc.default.id
  enable_kms_encryption      = var.enable_kms_encryption
  kms_key_deletion_window    = var.kms_key_deletion_window
  tags                       = local.common_tags
}

module "monitoring" {
  source = "./modules/monitoring"

  cluster_name        = local.cluster_name
  log_retention_days  = var.log_retention_days
  tags                = local.common_tags
}

module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name               = local.cluster_name
  kubernetes_version         = var.kubernetes_version
  vpc_id                     = data.aws_vpc.default.id
  subnet_ids                 = data.aws_subnets.default.ids
  
  endpoint_private_access    = var.endpoint_private_access
  endpoint_public_access     = var.endpoint_public_access
  public_access_cidrs        = var.public_access_cidrs
  
  cluster_security_group_id  = module.security.cluster_security_group_id
  kms_key_arn                = module.security.kms_key_arn
  
  enable_cluster_logging     = var.enable_cluster_logging
  cloudwatch_log_group_name  = module.monitoring.cloudwatch_log_group_name
  
  # Node group configuration
  desired_capacity           = var.desired_capacity
  min_capacity               = var.min_capacity
  max_capacity               = var.max_capacity
  instance_types             = var.instance_types
  capacity_type              = var.capacity_type
  disk_size                  = var.disk_size
  node_labels                = var.node_labels
  
  tags                       = local.common_tags
  
  depends_on = [
    module.security,
    module.monitoring
  ]
}