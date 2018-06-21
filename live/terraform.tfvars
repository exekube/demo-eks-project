terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an GCS bucket
  remote_state {
    backend = "s3"

    config {
      shared_credentials_file = "/root/.aws/credentials"
      region                  = "${get_env("TF_VAR_aws_region", "us-west-2")}"
      bucket                  = "eks-experimental-ilya-tfstate-dev"
      key                     = "${path_relative_to_include()}"
    }
  }

  terraform {
    extra_arguments "auto_approve" {
      commands  = ["apply"]
      arguments = ["-auto-approve"]
    }

    extra_arguments "force_destroy" {
      commands  = ["destroy"]
      arguments = ["-force"]
    }
  }
}
