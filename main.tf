provider "aws" {
  region = "us-east-1"  # Set your AWS region here
}

module "s3" {
  source         = "./modules/s3"
  input_bucket   = "my-polly-input-bucket"
  output_bucket  = "my-polly-output-bucket"
}

module "iam" {
  source         = "./modules/iam"
  input_bucket_arn  =  module.s3.input_bucket_arn
  output_bucket_arn =  module.s3.output_bucket_arn
}

module "lambda" {
  source              = "./modules/lambda"
  lambda_function_name = "PollyTextToSpeech"
  role_arn            = module.iam.lambda_role_arn
  output_bucket       = module.s3.output_bucket_name
  input_bucket        = module.s3.input_bucket_name
}
