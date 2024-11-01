variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "gbfs-cluster"
}

variable "ecs_service" {
  description = "Name of the ecs service"
  type        = string
  default     = "gfbs-service"
}

variable "security_group" {
  description = "Name of the security group"
  type        = string
  default     = "gbfs-sg"
}

variable "iam_role" {
  description = "Name of the iam role"
  type        = string
  default     = "gbfsEcsTaskExecutionRole"
}

variable "docker_image" {
  description = "The Docker image to deploy for the gbfs-dashboard application"
  type        = string
}