variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "aws-polly-tts-lambda"
}

variable "s3_bucket_name" {
  description = "S3 bucket name to store audio files"
  default     = "aws-polly-tts-bucket"
}
