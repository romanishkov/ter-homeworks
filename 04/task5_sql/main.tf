module "vpc" {
  source = "./vpc"
  env_name = var.vpc_name
  subnets = var.subnets
}

# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }
# resource "yandex_vpc_subnet" "develop" {
#   name           = var.vpc_name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr
# }

module "example-cluster" {
  source         = "./cluster"
  cluster_name = var.cluster_name
  zone = var.default_zone
  network_id       = module.vpc.vpc_network.id
  subnet_id     = module.vpc.vpc_subnet[var.default_zone].id
  ha = var.ha
  resource_preset_id = var.resource_preset_id

}

module "db_user" {
  source         = "./db_user"
  cluster_id = module.example-cluster.id
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}