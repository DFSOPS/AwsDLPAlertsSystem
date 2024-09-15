#S3 Bucket Creation
provider "aws" {
  region = "eu-west-2"  # London region
}

resource "aws_s3_bucket" "bucketle4k" {
  bucket = "bucketle4k"  # S3 bucket name
}
terraform {
  backend "s3" {
    bucket         = "bucketle4k"  # S3 bucket for state file
    key            = "terraform/state.tfstate"      # State file path
    region         = "eu-west-2"
  }
}

# Other resources here
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

# Define the CloudWatch Event Rule (EventBridge Rule)
resource "aws_cloudwatch_event_rule" "macie_alerts" {
  name        = "MacieAlerts"
  description = "Trigger for Macie findings"
  event_pattern = jsonencode({
    source       = ["aws.macie"]
    detail_type  = ["Macie Finding"]
  })
}

# Define the CloudWatch Event Target
resource "aws_cloudwatch_event_target" "macie_alert_target" {
  rule      = aws_cloudwatch_event_rule.macie_alerts.name
  arn       = aws_sns_topic.personal_data_alert.arn

  # Use input for the target, provide JSON formatted input
  input = jsonencode({
    Alert       = "Macie Finding - Severity: <severity>"
    Bucket      = "<bucketName>"
    Object      = "<objectKey>"
    Description = "<description>"
  })
}

# Grant EventBridge permissions to publish to SNS
resource "aws_sns_topic_policy" "macie_alert_policy" {
  arn    = aws_sns_topic.personal_data_alert.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "SNS:Publish"
        Resource  = aws_sns_topic.personal_data_alert.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_cloudwatch_event_rule.macie_alerts.arn
          }
        }
      }
    ]
  })
}