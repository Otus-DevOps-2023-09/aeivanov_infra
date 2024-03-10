#terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">= 0.13"
#}

#provider "yandex" {
#  service_account_key_file = var.service_account_key_file
#  cloud_id                 = var.cloud_id
#  folder_id                = var.folder_id
#  zone                     = var.zone
#}

resource "yandex_storage_bucket" "test-aeivanov" {
  access_key    = var.access_key
  secret_key    = var.secret_key
  bucket        = var.bucket_name
  force_destroy = "true"
}
