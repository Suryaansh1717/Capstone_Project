output "iam_user_name" {
  description = "Created IAM user name"
  value       = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  description = "ARN of the created IAM user"
  value       = aws_iam_user.s3_reader.arn
}
