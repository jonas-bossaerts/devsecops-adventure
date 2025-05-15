# modules/kind/main.tf
resource "null_resource" "create_kind_cluster" {
  provisioner "local-exec" {
    command = <<EOT
      kind create cluster --name ${var.cluster_name} --config ${path.module}/kind-config.yaml
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      kind delete cluster --name ${self.triggers.cluster_name}
    EOT
  }

  triggers = {
    cluster_name = var.cluster_name
    always_run   = timestamp() # zodat je altijd kunt applyen
  }
}


variable "cluster_name" {
  type = string
}
