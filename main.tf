resource "google_container_registry" "registry" {
  project  = "klara-comm-nonprod"
  location = "EU"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "terraform-test-static-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}