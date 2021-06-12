terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ca-central-1"
}

module "security_group" {
  source = "../."

  name = "security-group-sample"
  ingress_rules = [
    {
      "name": "TLS",
      "port": 443
    },
    {
      "name": "SSH",
      "port": 22
    }
  ]
  tags = {
    name = "security-group-sample"
    environment = "dev"
  }
}
