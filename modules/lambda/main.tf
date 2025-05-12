resource "aws_lambda_function" "polly" {
  function_name    = var.lambda_function_name
  role             = var.role_arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  filename         = "${path.module}/../../lambda/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../../lambda/lambda.zip")

  environment {
    variables = {
      OUTPUT_BUCKET = var.output_bucket
    }
  }
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.polly.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.input_bucket}"
}

resource "aws_s3_bucket_notification" "trigger_lambda" {
  bucket = var.input_bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.polly.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
