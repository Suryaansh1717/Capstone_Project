output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.website_bucket.id
}

output "website_url" {
  description = "Public S3 static website endpoint URL"
  value       = "http://${aws_s3_bucket_website_configuration.website_config.website_endpoint}"
}
