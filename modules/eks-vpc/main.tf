terraform {
  backend "s3" {}
}

variable "aws_region" {}
variable "cluster_name" {}

provider "aws" {
  version                 = ">= 1.22.0"
  region                  = "${var.aws_region}"
  shared_credentials_file = "/root/.aws/credentials"
}

data "aws_availability_zones" "available" {}

locals {
  tags = "${map("Environment", "test",
                "GithubRepo", "terraform-aws-eks",
                "GithubOrg", "terraform-aws-modules",
                "Workspace", "${terraform.workspace}",
  )}"
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "1.14.0"
  name               = "${var.cluster_name}-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}", "${data.aws_availability_zones.available.names[2]}"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = "${merge(local.tags, map("kubernetes.io/cluster/${var.cluster_name}", "shared"))}"
}

output "subnets" {
  value = "${module.vpc.public_subnets}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}
