variable "name" {
  description = "The name of the app for which the security group is being created."
  type = string
}

variable "tags" {
  description = "The tags to put on resources created by this module."
  type = map(string)
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
