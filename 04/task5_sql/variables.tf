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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "subnets" {
  type        = list(object({
    zone = string, cidr = string
  }))
  default = [ 
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" } 
  ]
}

variable "cluster_name" {
  type        = string
  description = "cluster_name"
}

variable "ha" {
  type        = bool
  default     = false
  description = "false if one host, true if more than one (see host_num)"
}

variable "db_name" {
  type        = string
  description = "db_name"
}

variable "db_username" {
  type        = string
  description = "db_username"
}

variable "db_password" {
  type        = string
  description = "db_password"
}

variable "resource_preset_id" {
  type        = string
  default     = "b1.medium"
  description = "resource_preset_id"
}
