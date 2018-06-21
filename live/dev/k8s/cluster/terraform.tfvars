# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//eks-cluster"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

vpc_id = "vpc-8e0debf4"

subnets = [
  "subnet-9d37effa",
  "subnet-6e9f4540",
  "subnet-78452932",
]
