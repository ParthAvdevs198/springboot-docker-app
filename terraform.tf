provider "kubernetes" {
  host = "https://kubernetes.default.svc:443"
}

resource "kubernetes_deployment" "epost-app" {
  metadata {
    name = "epost-app"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "epost-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "epost-app"
        }
      }

      spec {
        containers {
          name = "epost-app"
          image = "epost-hub:latest"
          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "my-app" {
  metadata {
    name = "epost-app"
  }

  spec {
    selector = {
      app = "epost-app"
    }

    ports {
      port = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}