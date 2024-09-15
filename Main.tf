#S3 Bucket Creation
provider "aws" {
  region = "eu-west-2"  # London region
}

resource "aws_s3_bucket" "bucketle4k" {
  bucket = "bucketle4k"  # S3 bucket name
  acl    = "private"     # Default ACL, change as needed
}
#
