resource "aws_lambda_function" "polly_lambda" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 30

  # Assuming the lambda.zip file is in the "lambda" folder.
  s3_bucket = var.s3_bucket_name
  s3_key    = "lambda_function.zip"
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.polly_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.s3_bucket_name}"
}
