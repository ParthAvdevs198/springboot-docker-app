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


resource "google_container_registry_image" "my_image" {
  name = "my_image:latest"
  registry = "gcr.io/klara-comm-nonprod/github.com/parthavdevs198/springboot-docker-app"
  image = "my_image:latest"
  triggers = {
    image_change = {
      source = "google_container_registry_image.my_image"
    }
  }
}