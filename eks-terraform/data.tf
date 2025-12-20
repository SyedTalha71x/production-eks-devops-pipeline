data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "default" {
  default = true
}

# Get available AZs, excluding us-east-1e which doesn't support EKS
data "aws_availability_zones" "available" {
  state = "available"
  
  # EKS doesn't support us-east-1e
  exclude_names = ["us-east-1e"]
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = data.aws_availability_zones.available.names
  }
}