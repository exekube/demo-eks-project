# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//guestbook"
  }

  dependencies {
    paths = [
      "../../kube-system/administration-tasks",
      "../../kube-system/nginx-ingress",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Environment-specific configuration (empty means all default)

