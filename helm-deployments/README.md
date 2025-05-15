# Helm Deployments

Deze directory bevat de configuratie voor het deployen van Helm charts in het lokale Kubernetes-cluster. In dit geval wordt de Traefik-ingresscontroller gedeployed.

## 📁 Structuur

```bash
helm-deployments/
├── main.tf              # Helm release configuratie voor Traefik
├── variables.tf         # Variabelen voor de Helm release
├── outputs.tf           # Outputwaarden zoals het dashboard en ingress URL's
├── providers.tf         # Providers configuratie voor Helm en Kubernetes
├── values/
│   └── traefik-values.yaml  # Waardenbestand voor de Traefik Helm chart
└── README.md            # Documentatie over deze directory
```

## 🚀 Deployen van Traefik

1. Zorg ervoor dat je `kind` cluster actief is. Zie de instructies in de [hoofd README](../README.md).
2. Voer het volgende commando uit om de Helm release te deployen:
    ```bash
    terraform init
    terraform apply
    ```

## 📊 Toegang tot het Traefik Dashboard

Het Traefik-dashboard is standaard niet publiek toegankelijk. Om toegang te krijgen, gebruik je het volgende commando:

```bash
kubectl port-forward -n traefik svc/traefik 9000:9000
```

Open daarna je browser en ga naar: [http://localhost:9000/dashboard/](http://localhost:9000/dashboard/).

## 🌐 Toegang tot Applicaties

Na het deployen kun je applicaties bereiken via de volgende URL's:

- **HTTP**: [http://localhost:8080](http://localhost:8080)
- **HTTPS**: [https://localhost:8443](https://localhost:8443)

## 📄 Belangrijke Bestanden

- **`main.tf`**: Bevat de configuratie voor het deployen van de Traefik Helm chart.
- **`values/traefik-values.yaml`**: Dit bestand bevat de specifieke configuratie voor Traefik, zoals poorten en dashboardinstellingen.
- **`outputs.tf`**: Geeft nuttige informatie zoals de URL's voor het dashboard en de ingress.

## 🛠️ Vereisten

- Terraform
- Helm
- kubectl
- Een actief `kind` cluster