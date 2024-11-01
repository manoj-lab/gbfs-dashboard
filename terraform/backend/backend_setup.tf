provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-gbfs-terraform-state-bucket"
}

# Enable versioning for state management
resource "aws_s3_bucket_versioning" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioning-bucket-config" {
  depends_on = [aws_s3_bucket_versioning.terraform_state_bucket]

  bucket = aws_s3_bucket.terraform_state_bucket.id

  noncurrent_version_expiration {
      noncurrent_days = 90
    }

  noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }
    status = "Enabled"
}

