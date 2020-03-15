resource "aws_iam_role" "lambda_voice" {
  name                = "VoiceServiceLambda"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "AssumeLambdaRole"
    }
  ]
}
  EOF
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "GazePlayLambdaLogging"
  description = "Create and Write to all CloudWatch Logs."

  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_read_write_s3" {
  name    = "ReadWriteS3Bucket"

  policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::*"
    }
  ]
}
  EOF
}

resource "aws_iam_policy_attachment" "attach_logging" {
  name       = "lambda-attachment"
  roles      = [
    aws_iam_role.lambda_voice.name
  ]
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_iam_policy_attachment" "attach_customers_dynamo" {
  name       = "s3-attachment"
  roles      = [
    aws_iam_role.lambda_voice.name,
  ]
  policy_arn = aws_iam_policy.lambda_read_write_s3.arn
}
