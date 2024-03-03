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

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_prop.marketing.env_name
  network_id     = module.vpc.vpc_network.id
  subnet_zones   = var.vm_prop.marketing.subnet_zones
  subnet_ids     = [module.vpc.vpc_subnet[var.vm_prop.marketing.subnet_zones[0]].id]
  instance_name  = var.vm_prop.marketing.inst_name
  instance_count = var.vm_prop.marketing.inst_count
  image_family   = var.vm_prop.marketing.image_family
  public_ip      = var.vm_prop.marketing.pub_ip
  labels         = var.vm_prop.marketing.labels


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_prop.analytics.env_name
  network_id     = module.vpc.vpc_network.id
  subnet_zones   = var.vm_prop.analytics.subnet_zones
  subnet_ids     = [module.vpc.vpc_subnet[var.vm_prop.analytics.subnet_zones[0]].id]
  instance_name  = var.vm_prop.analytics.inst_name
  instance_count = var.vm_prop.analytics.inst_count
  image_family   = var.vm_prop.analytics.image_family
  public_ip      = var.vm_prop.analytics.pub_ip
  labels         = var.vm_prop.analytics.labels

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    username           = var.username
    ssh_public_key     = jsonencode([file(var.ssh_public_key)])
    packages           = jsonencode(var.packages)
  }
}

# output "debug" {
#   value = values(module.vpc.vpc_subnet).*.id
# }