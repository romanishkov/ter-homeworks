###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "your_ssh_ed25519_key"
#   description = "ssh-keygen -t ed25519"
# }

variable "username" {
  type = string
}

variable "ssh_public_key" {
  type        = string
  description = "Location of SSH public key."
}

variable "packages" {
  type    = list
  default = []
}

variable "vm_prop" {
  type = map(object({ env_name=string, subnet_zones=list(string), 
    inst_name=string, inst_count=number, image_family=string, pub_ip=bool,
    labels=map(string) }))
}

variable "subnets" {
  type        = list(object({
    zone = string, cidr = string
  }))
  default = [ 
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" } 
  ]
}

variable "security_group_ids" {
  type        = list(string)
  description = "security_group_ids"
}
