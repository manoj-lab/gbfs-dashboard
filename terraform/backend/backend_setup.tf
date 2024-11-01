provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-gbfs-terraform-state-bucket"

  #Define lifecycle rules if you want to archive/delete old state versions
  lifecycle_rule {
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 365
    }
  }
}
# Enable versioning for state management
resource "aws_s3_bucket_versioning" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
