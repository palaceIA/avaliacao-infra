provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"

  # evita chamadas reais para AWS
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  # necessário para LocalStack
  s3_use_path_style = true

  endpoints {
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}