variable "cluster_name" {
  type        = string
  default     = "study_cluster"
  description = "Cluster name"
}

variable "zone" {
  type        = string
  description = "Avaliability zone"
}

variable "network_id" {
  type        = string
  description = "Network ID"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "environment" {
  type        = string
  default     = "PRODUCTION"
  description = "environment"
}

variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "version"
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "deletion_protection"
}

variable "resource_preset_id" {
  type        = string
  default     = "b1.medium"
  description = "resource_preset_id"
}

variable "disk_type_id" {
  type        = string
  default     = "network-hdd"
  description = "disk_type_id"
}

variable "disk_size" {
  type        = number
  default     = 10
  description = "Cluster name"
}

variable "assign_public_ip" {
  type        = bool
  default     = true
  description = "assign_public_ip"
}

variable "ha" {
  type        = bool
  default     = false
  description = "false if one host, true if more than one (see host_num)"
}

variable "ha_num" {
  type        = number
  default     = 2
  description = "number of hosts in ha cluster"
}
