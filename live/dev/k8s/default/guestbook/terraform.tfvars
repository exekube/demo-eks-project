# ↓ Module metadata

terragrunt = {
  terraform {
    source = "/project/modules//guestbook"
  }

  dependencies {
    paths = [
      "../../kube-system/administration-tasks",
    ]
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ↓ Module configuration (empty means all default)

