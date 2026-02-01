resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    id     = "log-lifecycle-rule"
    status = "Enabled"
    #apply rule to all object
    filter {}

    #move object to standared=IA after 30 days
    transition {
      days          = 30
      storage_class = "STANDARED_IA"
    }
    #move object to glacier after 90 days
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
    #Delete object after 180 days
    expiration {
      days = 180
    }

    #delete old version after 30 days
    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
