variable "aws_region" {
  description = "AWS region for infrastructure resources"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Deployment environment tag"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project identifier for resource naming"
  type        = string
  default     = "suryaansh-vc-infra"
}
