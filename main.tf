# resource "google_container_registry" "registry" {
#   project  = "klara-comm-nonprod"
#   location = "EU"
# }
#
# resource "google_storage_bucket" "auto-expire" {
#   name          = "terraform-test-static-bucket"
#   project       = "klara-comm-nonprod"
#   location      = "US"
#   force_destroy = true
#
#   public_access_prevention = "enforced"
# }
#
# resource "null_resource" "push_to_gcr" {
#   triggers = {
    # You can add triggers here if needed.
#   }

#   provisioner "local-exec" {
#     command = "docker"
#     working_dir = path.module
#
#     # Build and push the Docker image to GCR.
#     # Replace 'your-image' with the actual image name and tag.
#     arguments = [
#       "build",
#       "-t", "gcr.io/$PROJECT_ID/epost-hub-new:latest",
#       ".",
#     ]
#   }
#   provisioner "local-exec" {
#       command = <<EOT
#         docker build -t gcr.io/$PROJECT_ID/epost-hub:latest .
#         docker push gcr.io/$PROJECT_ID/epost-hub:latest
#       EOT
#     }
# }

# terraform {
#   required_providers {
#     google = {
#       source = "hashicorp/google"
#       version = "4.51.0"
#     }
#   }
# }
#
# resource "docker_image" "backend-image" {
#     name = "backend"
#
#     build {
#         path = "/"
#         dockerfile = "backend.Dockerfile"
#     }
# }

#
# resource "google_container_registry_image" "nginx" {
#   name = "klara-epost-hub:latest"
#   registry = "gcr.io/klara-comm-nonprod/github.com/parthavdevs198/springboot-docker-app"
#   image = "klara-epost-hub:latest"
#   triggers = {
#     image_change = {
#       source = "google_container_registry_image.klara-epost-hub"
#     }
#   }
# }

# data "google_container_registry_image" "klara-epost-hub" {
#   name = "gcr.io/klara-comm-nonprod/github.com/parthavdevs198/springboot-docker-app" # Replace with the path to your image in GCR
# }
#
# output "image_digest" {
#   value = data.google_container_registry_image.klara-epost-hub.demo
# }


# terraform {
#   required_providers {
#     docker = {
#       source = "kreuzwerker/docker"
#       version = "~> 3.0.1"
#     }
#   }
# }
#
# provider "docker" {}
#
# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = false
# }
#
# resource "docker_container" "nginx" {
#   image = docker_image.nginx.image_id
#   name  = "tutorial"
#   ports {
#     internal = 80
#     external = 8000
#   }
# }