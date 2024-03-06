variable "ip_addr" {
  type        = string
  default     = "192.168.0.1"
  description = "ip string validation"
  validation {
    condition = can(cidrnetmask("${var.ip_addr}/32"))
    error_message = "Must be a valid IPv4 address."
  }
}
variable "ip_addr_list" {
  type        = list(string)
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  description = "list of ip string validation"
  validation {
    condition = alltrue([
      for a in var.ip_addr_list : can(cidrnetmask("${a}/32"))
    ])
    error_message = "All elements must be a valid IPv4 address."
  }
}
variable "low_string" {
  type        = string
  default     = "всё в нижнем регистре"
  description = "любая строка"
  validation {
    condition = lower(var.low_string) == var.low_string
    error_message = "Only lower case allowed."
  }
}
variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })
    default = {
        Dunkan = false
        Connor = false
    }
    validation {
        error_message = "There can be only one MacLeod"
        condition = var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
    }
}
