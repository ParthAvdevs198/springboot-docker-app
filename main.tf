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

resource "null_resource" "push_to_gcr" {
  triggers = {
    # You can add triggers here if needed.
  }

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
  provisioner "local-exec" {
      command = <<EOT
        docker build -t gcr.io/$PROJECT_ID/epost-hub:latest .
        docker push gcr.io/$PROJECT_ID/epost-hub:latest
      EOT
      working_dir = path.module
    }
}