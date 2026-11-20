resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "versioned_infra_bucket" {
  bucket        = "${var.project_name}-${var.environment}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "${var.project_name}-bucket"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.versioned_infra_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
