resource "aws_s3_bucket" "input" {
  bucket = var.input_bucket
}

resource "aws_s3_bucket" "output" {
  bucket = var.output_bucket
}
