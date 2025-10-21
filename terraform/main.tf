terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
  required_version = ">= 1.4.0"
}

resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  bucket_full_name = "${var.bucket_name_prefix}"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket        = local.bucket_full_name
  force_destroy = true

  tags = {
    Name = "infra-prova-bucket"
    Env  = "lab-localstack"
  }
}

resource "aws_iam_user" "lab_user" {
  name = "infra_prova_user"
}

# Política mínima com ARNs corretos (bucket e objetos)
resource "aws_iam_user_policy" "lab_user_policy" {
  name = "lab_user_policy"
  user = aws_iam_user.lab_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "ListBucket"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = aws_s3_bucket.app_bucket.arn
      },
      {
        Sid      = "ObjectRW"
        Effect   = "Allow"
        Action   = ["s3:PutObject", "s3:GetObject"]
        Resource = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}