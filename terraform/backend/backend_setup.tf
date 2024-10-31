provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-gbfs-terraform-state-bucket"  # Change to a unique name

  # Enable versioning for state management
  versioning {
    enabled = true
  }

  # Optional: Define lifecycle rules if you want to archive/delete old state versions
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
