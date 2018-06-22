# Multi-Environment EKS VPC and Cluster

This is a proof-of-concept solution that uses:

- Docker Compose as a local environment to free up DevOps Engineers from managing tools like `aws` CLI, `kubectl`, `helm`, `heptio-aws-authenticator`, `terraform`, etc.
- Terraform for creating and managing AWS VPC and EKS-related resources
- Terragrunt for using Terraform in multiple environments with maximum code reuse
- Helm for packaging and managing Kubernetes resources
