resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "insecure-bucket"
}

resource "aws_s3_bucket_public_access_block" "vulnerable_block" {
  bucket = aws_s3_bucket.vulnerable_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}