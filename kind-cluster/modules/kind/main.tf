# modules/kind/main.tf
resource "null_resource" "create_kind_cluster" {
  provisioner "local-exec" {
    command = <<EOT
      kind create cluster --name ${var.cluster_name} --config ${path.module}/kind-config.yaml
    EOT
  }

  triggers = {
    always_run = timestamp() # zodat je altijd kunt applyen
  }
}


variable "cluster_name" {
  type = string
}
