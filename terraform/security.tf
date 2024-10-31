# Security Group for ECS Service
resource "aws_security_group" "my_sg" {
  name        = var.security_group
  description = "Security group for GBFS ECS service"
  vpc_id      = "vpc-0fbf645e2dcce4a21" # Replace with your VPC ID

  # Allow inbound traffic on port 80 for HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
