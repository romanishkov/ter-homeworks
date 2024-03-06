output "bucket_name" {
  description = "The name of the bucket."
  value       = module.s3.bucket_name
}

output "storage_admin_service_account_id" {
  description = "Service account ID of the Object storage admin."
  value       = module.s3.storage_admin_service_account_id
}

output "storage_admin_access_key" {
  description = "Static access key of the autogenerated Object storage admin service account."
  value       = module.s3.storage_admin_access_key
}

output "storage_admin_secret_key" {
  description = "Static secret key of the autogenerated Object storage admin service account."
  sensitive   = true
  value       = module.s3.storage_admin_secret_key
}

output "ydb_document_api_endpoint" {
  description = "The name of the bucket."
  value       = yandex_ydb_database_serverless.state_lock_db.document_api_endpoint
}

output "ydb_name" {
  description = "The name of the bucket."
  value       = yandex_ydb_database_serverless.state_lock_db.name
}

output "ydb_id" {
  description = "The name of the bucket."
  value       = yandex_ydb_database_serverless.state_lock_db.id
}