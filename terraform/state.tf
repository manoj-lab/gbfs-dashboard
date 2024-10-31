terraform {
  backend "s3" {
    bucket = "my-gbfs-terraform-state-bucket"
    key    = "gbfs-dashboard/terraform.tfstate"
    region = "us-east-1"
  }
}