variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM Role ARN for Lambda"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket containing Lambda code"
  type        = string
}
