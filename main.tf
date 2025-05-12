provider "aws" {
  region = "us-east-1"  # Set your AWS region here
}

module "iam" {
  source = " ./modules/iam"
}

module "s3" {
  source         = "./modules/s3"
  input_bucket   = "my-polly-input-bucket"
  output_bucket  = "my-polly-output-bucket"
}

module "lambda" {
  source = " ./modules/lambda"
  lambda_role_arn = module.iam.lambda_role_arn
  s3_bucket_name  = module.s3.bucket_name
}
