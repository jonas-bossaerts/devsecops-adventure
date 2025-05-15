terraform {
  required_version = ">= 1.3"
}

module "kind" {
  source       = "./modules/kind"
  cluster_name = var.cluster_name
}

