resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["logs:*"],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = ["s3:GetObject", "s3:PutObject"],
        Resource = [
          "${var.input_bucket_arn}/*",
          "${var.output_bucket_arn}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = ["polly:SynthesizeSpeech"],
        Resource = "*"
      }
    ]
  })
}
