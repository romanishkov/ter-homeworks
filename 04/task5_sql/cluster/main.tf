terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}


resource "yandex_mdb_mysql_cluster" "cluster" {
  name                = var.cluster_name
  environment         = var.environment
  network_id          = var.network_id
  version             = var.mysql_version
#   security_group_ids  = [ "<список_идентификаторов_групп_безопасности>" ]
  deletion_protection = var.deletion_protection

  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = var.disk_type_id
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each = range(local.num)
    content {
      zone             = var.zone
      subnet_id        = var.subnet_id
      assign_public_ip = var.assign_public_ip
    }
  }
}