# DevSecOps Lab (Lokaal)

Dit project bevat een lokaal Kubernetes-lab opgezet met `kind` en beheerd via Terraform. Het is bedoeld om hands-on DevOps en DevSecOps principes te leren en toe te passen.

## 📦 Module 1: kind-cluster via Terraform

In deze module zetten we een `kind` cluster lokaal op:

### ✅ Tools

- Terraform
- kind
- Docker Desktop
- kubectl
- k9s (optioneel)

### 📁 Structuur

```bash
kind-cluster/
├── main.tf              # Roept de kind module aan
├── variables.tf
├── outputs.tf
└── modules/
    └── kind/
        ├── main.tf         # Bevat null_resource met local-exec
        └── kind-config.yaml

