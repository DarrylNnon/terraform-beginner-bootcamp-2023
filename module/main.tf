terraform {
required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}
# S3 Bucket for Static Website Hosting
resource "aws_s3_bucket" "static_site" {
  bucket = "my-static-website-bucket"  # Change to a unique bucket name
}

# Enable Static Website Hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Bucket Policy to Allow Public Read Access
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_site.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.static_site.id}/*"
    }
  ]
}
EOF
}

# Upload Example HTML Files
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.static_site.id
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.static_site.id
  key    = "error.html"
  source = "error.html"
  acl    = "public-read"
  content_type = "text/html"
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
