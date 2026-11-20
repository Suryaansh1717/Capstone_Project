resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "hardened_bucket" {
  bucket        = "suryaansh-branch-policy-${var.environment}-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "Hardened-Infra-Bucket"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.hardened_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
