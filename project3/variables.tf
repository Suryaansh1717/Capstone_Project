variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "Existing Default VPC ID in ap-south-1"
  type        = string
  default     = "vpc-03389c41f719f68ac"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "cpu_threshold" {
  description = "CPU utilization percentage threshold to trigger CloudWatch Alarm"
  type        = number
  default     = 50
}

variable "project_name" {
  description = "Prefix for resource names"
  type        = string
  default     = "suryaansh-ec2-monitor"
}
