#S3 Bucket Creation
provider "aws" {
  region = "eu-west-2"  # London region
}

resource "aws_s3_bucket" "bucketle4k" {
  bucket = "bucketle4k"  # S3 bucket name
}
# Create SNS Topic
resource "aws_sns_topic" "personal_data_alert" {
  name = "PersonalDataAlert"
}

# Subscribe email to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.personal_data_alert.arn
  protocol  = "email"
  endpoint  = "sayess.da@gmail.com"  # Email to subscribe
}
