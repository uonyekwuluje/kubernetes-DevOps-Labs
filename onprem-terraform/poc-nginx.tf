resource "kubernetes_deployment" "poc_nginx_deployment" {
  metadata {
    name = "poc-nginx-deployment"
    namespace = "hello-world-ns"
    labels = {
      app = "nginx-app"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx-app"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
        }
      }
    }
  }
}
