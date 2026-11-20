variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "suryaansh-s3-readonly-user"
}

variable "s3_read_policy" {
  description = "IAM policy JSON granting read-only access to Amazon S3"
  type        = string
  default     = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowS3ReadOnly",
        "Effect": "Allow",
        "Action": [
          "s3:Get*",
          "s3:List*",
          "s3:Describe*"
        ],
        "Resource": "*"
      }
    ]
  }
  EOF
}
