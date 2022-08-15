# TODO: Designate a cloud provider, region, and credentials

# variable access_key {
#     type = string
#     description="Importing AWS access key from the CLI"
# }

# variable secret_key {
#     type = string
#     description="Importing AWS secret key from the CLI"
# }


provider "aws" {
  region = var.region
  # Not using the credentials via CLI => profile configured in .aws/credentials
  # access_key = var.access_key
  # secret_key = var.secret_key
}

# Archive lambda for the upload to AWS

data "archive_file" "archive_lambda" {
  type        = "zip"
  source_file = "./greet_lambda.py"
  output_path = "./greet_lambda.zip"
}

# Create a IAM Role for lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# TODO: Create a Lambda function

resource "aws_lambda_function" "lambda_function" {
  description   = "Greetings Lambda Function"
  filename      = "./greet_lambda.zip"
  function_name = "udacity-aca-project2-greet_lambda"
  handler       = "greet_lambda.lambda_handler"
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = "python3.8"

  environment {
    variables = {
      greeting = "Hello"
    }
  }

}

