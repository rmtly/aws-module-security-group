variable "app_name" {
  description = "The name of the app for which the security group is being created."
  type = string
}

variable "environment" {
  description = "The software execution environment in which the app is being deployed."
  type = string
}

variable "ingress_rules" {
  description = "The ingress rules for the security group being created."
  type = list(
    object(
      {
        name = string,
        port = number,
        protocol = optional(string)
        source_cidrs = optional(list(string))
        source_ipv6_cidrs = optional(list(string))
      }
    )
  )
}
