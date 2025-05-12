variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "input_bucket" {
  description = "Name of the S3 input bucket to store text files"
  type        = string
  default     = "my-polly-input-bucket"
}

variable "output_bucket" {
  description = "Name of the S3 output bucket to store audio files"
  type        = string
  default     = "my-polly-output-bucket"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "PollyTextToSpeech"
}
