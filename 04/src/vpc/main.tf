terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_vpc_network" "develop" {
  name = var.env_name
}
resource "yandex_vpc_subnet" "develop" {
  for_each   = {
    for index, zone_name in var.subnets:
    zone_name.zone => zone_name
  }
  name           = "${var.env_name}_${each.value.zone}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [ each.value.cidr ]
}