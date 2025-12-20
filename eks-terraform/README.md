# AWS EKS Auto Mode Terraform Infrastructure

Production-grade Terraform configuration for AWS EKS with Auto Mode.

## Architecture

- **EKS Auto Mode**: Automatic node provisioning and scaling
- **Multi-Environment**: Support for dev, staging, and prod
- **Security**: KMS encryption, private endpoints, security groups
- **Monitoring**: CloudWatch logging with configurable retention
- **Modular Design**: Reusable modules for maintainability

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured
- kubectl installed

## Quick Start

### 1. Clone and Setup
```bash
git clone <repo-url>
cd eks-terraform
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Deploy (Dev Environment)
```bash
terraform plan -var-file=environments/dev/terraform.tfvars
terraform apply -var-file=environments/dev/terraform.tfvars
```

### 4. Configure kubectl
```bash
aws eks update-kubeconfig --region us-east-1 --name myapp-dev-eks
kubectl get nodes
```

## Project Structure

- `modules/` - Reusable Terraform modules
  - `eks-cluster/` - EKS cluster and IAM
  - `security/` - Security groups and KMS
  - `monitoring/` - CloudWatch logging
- `environments/` - Environment-specific configurations
- Root files - Main Terraform configuration

## Best Practices Implemented

✅ Modular architecture  
✅ Environment separation  
✅ Remote state management  
✅ KMS encryption  
✅ Comprehensive logging  
✅ Security groups  
✅ Auto Mode enabled  
✅ Proper IAM roles  
✅ Tagging strategy  
✅ Input validation  

## Customization

Edit `environments/<env>/terraform.tfvars` to customize:
- Region and cluster version
- Access controls
- Logging retention
- Encryption settings

## Cleanup

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

## License

MIT
```

---

## Deployment Instructions

```bash
# 1. Initialize
terraform init

# 2. Format code
terraform fmt -recursive

# 3. Validate
terraform validate

# 4. Plan for dev
terraform plan -var-file=environments/dev/terraform.tfvars

# 5. Apply
terraform apply -var-file=environments/dev/terraform.tfvars

# 6. Configure kubectl
aws eks update-kubeconfig --region us-east-1 --name myapp-dev-eks