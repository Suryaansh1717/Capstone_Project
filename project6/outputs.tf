output "bucket_name" {
  description = "Name of the version-controlled S3 bucket"
  value       = aws_s3_bucket.versioned_infra_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.versioned_infra_bucket.arn
}
