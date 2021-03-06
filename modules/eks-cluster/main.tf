terraform {
  backend "s3" {}
}

variable "subnets" {
  type = "list"
}

variable "cluster_name" {}
variable "vpc_id" {}

locals {
  worker_groups = "${list(
                  map("instance_type","t2.medium",
                      "additional_userdata","echo foo bar",
                      "asg_desired_capacity","2",
                      "asg_min_size","2"
                      ),
  )}"

  tags = "${map("Environment", "test",
                "GithubRepo", "terraform-aws-eks",
                "GithubOrg", "terraform-aws-modules",
                "Workspace", "${terraform.workspace}",
  )}"
}

provider "aws" {
  version                 = ">= 1.22.0"
  region                  = "us-west-2"
  shared_credentials_file = "/root/.aws/credentials"
}

module "eks" {
  source = "github.com/ilyasotkov/terraform-aws-eks"

  # version       = "1.0.0"
  cluster_name  = "${var.cluster_name}"
  subnets       = "${var.subnets}"
  tags          = "${local.tags}"
  vpc_id        = "${var.vpc_id}"
  worker_groups = "${local.worker_groups}"
}

output "k8s_version" {
  value = "${module.eks.cluster_version}"
}

# output "kubeconfig" {
#   value = "${module.eks.kubeconfig}"
# }

resource "local_file" "kubeconfig" {
  content  = "${module.eks.kubeconfig}"
  filename = "/root/.kube/config"
}
