
resource "google_artifact_registry_repository" "spotmusic-9aso-grupo9-frontend" {
  location = var.region
  repository_id = "spotmusic-9aso-grupo9-frontend"
  description = "Imagens Docker Frontend"
  format = "DOCKER"
}

resource "google_artifact_registry_repository" "spotmusic-9aso-grupo9-backend" {
  location = var.region
  repository_id = "spotmusic-9aso-grupo9-backend"
  description = "Imagens Docker Banckend"
  format = "DOCKER"
}

## Database
resource "google_sql_database_instance" "master" {
  name = "spotmusic-9aso-grupo9-database-instance"
  database_version = "MYSQL_8_0"
  region = var.region
    settings {
      tier = "db-g1-small"
    }

  deletion_protection  = "true"
}

resource "google_sql_database" "database" {
  name = "spotmusic-9aso-grupo9-database"
  instance = "${google_sql_database_instance.master.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "${google_sql_database_instance.master.name}"
  host = "%"
  password = "12345678"
}