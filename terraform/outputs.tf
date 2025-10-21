output "bucket_name" {
  description = "Nome completo do bucket criado"
  value       = aws_s3_bucket.app_bucket.bucket
}
