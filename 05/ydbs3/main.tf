module "ydb_s3" {
  source = "./ydbs3_module"
  folder_id = var.folder_id
}

# resource "random_string" "unique_id" {
#   length  = 8
#   upper   = false
#   lower   = true
#   numeric = true
#   special = false
# }

# module "s3" {
#   source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git"

#   bucket_name = "simple-bucket-${random_string.unique_id.result}"
#   max_size = 1073741824
# }

# resource "yandex_ydb_database_serverless" "state_lock_db" {
#   name                = "state-lock-db"

#   serverless_database {
#     storage_size_limit          = 1
#   }
# }

# resource "yandex_resourcemanager_folder_iam_member" "admin-account-iam" {
#   folder_id   = var.folder_id
#   role        = "ydb.editor"
#   member      = "serviceAccount:${module.s3.storage_admin_service_account_id}"
# }

# resource "yandex_ydb_table" "state_lock_table" {
#   path = "state-lock-table"
#   connection_string = yandex_ydb_database_serverless.state_lock_db.ydb_full_endpoint

# column {
#       name = "LockID"
#       type = "String"
#       not_null = true
#     }

#   primary_key = ["LockID"]

# }
