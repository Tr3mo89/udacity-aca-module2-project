# TODO: Define the output variable for the lambda function.
output "lambda_arn" {
  value       = aws_lambda_function.lambda_function.invoke_arn
  description = "Invoke ARN of the Lambda Function"
}