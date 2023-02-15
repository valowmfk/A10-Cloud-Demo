# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes
# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.
terraform {
  backend "s3" {
    bucket         = "<YOUR_BUCKET>"
    key            = "terraform.tfstate"
    region         = "<YOUR_REGION>"
    dynamodb_table = "<YOUR_TABLE>"
  }
}

locals {
  cluster_name = "a10-cloud-demo-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
