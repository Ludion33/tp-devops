# Create Heroku apps for production
resource "heroku_app" "production" {
  name = "devops-app-production"
  region = "us"
  buildpacks = [
    "heroku/go"
  ]
}

# Couple production app to production pipeline stage
resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.devops-app.id}"
  stage    = "production"
}

# Create a database, and configure the app to use it
resource "heroku_addon" "production-database" {
  app  = "${heroku_app.production.name}"
  plan = "heroku-postgresql:hobby-dev"
}
