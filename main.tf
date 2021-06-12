terraform {
  experiments = [
    module_variable_optional_attrs
  ]
}

locals {
  protocol = "tcp"
  source_cidrs = ["0.0.0.0/0"]
  source_ipv6_cidrs = ["::/0"]
}

resource "aws_security_group" "app" {
  name        = var.name
  description = "Allow traffic to ${var.name} node"

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description = ingress.value.name
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol != null ? ingress.value.protocol : local.protocol
      cidr_blocks = ingress.value.source_cidrs != null ? ingress.value.source_cidrs : local.source_cidrs
      ipv6_cidr_blocks = ingress.value.source_ipv6_cidrs != null ? ingress.value.source_ipv6_cidrs : local.source_ipv6_cidrs
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}
