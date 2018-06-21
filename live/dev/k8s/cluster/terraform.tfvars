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

subnets = [
  "subnet-4d24b306",
  "subnet-19bdc860",
  "subnet-b8b5f5e2",
]

vpc_id = "vpc-0b756772"
