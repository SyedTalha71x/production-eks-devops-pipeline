terraform {
  backend "s3" {
    # bucket         = "terraform-state-version-bucket"
    # key            = "eks/terraform.tfstate"
    # region         = "us-east-1"
    # dynamodb_table = "terraform-state-lock"
    # encrypt        = true
  }
}