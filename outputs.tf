output "dag_s3_path" {
  value = var.dag_s3_path
}

output "execution_role_arn" {
  value = aws_iam_role.mwaa_execution_role.arn
}

output "s3_bucket_name" {
 value = aws_s3_bucket.mwaa_bucket.id
}