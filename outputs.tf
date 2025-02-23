output "public_ip" {
  description = "IPs públicos"
  value       = aws_instance.this.public_ip
}

output "bucket_data" {
  description = "Url do bucket"
  value       = aws_s3_bucket.this.bucket_domain_name
}