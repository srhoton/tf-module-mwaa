resource "aws_s3_bucket" "mwaa_bucket" {
  bucket = "${var.env_name}-mwaa-bucket"
  tags = {
    Name = "${var.env_name}-mwaa-bucket"
  }
}

resource "aws_s3_bucket_acl" "mwaa_bucket_acl" {
  bucket = aws_s3_bucket.mwaa_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "mwaa_bucket_versioning" {
  bucket = aws_s3_bucket.mwaa_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "mwaa_bucket_public_access_block" {
  bucket = aws_s3_bucket.mwaa_bucket.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
