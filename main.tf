provider "aws" {
  region = var.region
}

module "s3" {
  source         = "./modules/s3"
  input_bucket   = var.input_bucket
  output_bucket  = var.output_bucket
}

module "iam" {
  source             = "./modules/iam"
  input_bucket_arn   = module.s3.input_bucket_arn
  output_bucket_arn  = module.s3.output_bucket_arn
}

module "lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  role_arn             = module.iam.lambda_role_arn
  output_bucket        = module.s3.output_bucket_name
  input_bucket         = module.s3.input_bucket_name
}
