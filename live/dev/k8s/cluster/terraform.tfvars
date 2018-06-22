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
  "subnet-5f4ddb14",
  "subnet-a90470d0",
  "subnet-dd470487",
]

vpc_id = "vpc-eabfad93"
