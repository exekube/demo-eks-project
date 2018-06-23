# Multi-Environment EKS VPC and Cluster

This is a proof-of-concept solution that uses:

- Docker Compose as a local environment manager to free up cloud developers from installing or keeping track of version compatibility of tools like `aws` CLI, `kubectl`, `helm`, `heptio-aws-authenticator`, `terraform`, etc.
- Terraform for creating and managing AWS VPC and EKS-related resources
- Terragrunt for using Terraform in multiple environments with maximum code reuse
- Helm for packaging and managing Kubernetes resources

## Getting Started

Once you clone this repository, the only thing you are required to have installed on your workstation is [Docker Community Edition](/) (Docker for Desktop). All other tools will be packaged within Docker images defined in [`docker-compose.yaml`](docker-compose.yaml) in the root of this repository.
