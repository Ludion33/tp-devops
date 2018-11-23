# Create Heroku apps for staging 
resource "heroku_app" "staging" {
  name = "devops-app-staging"
  region = "us"
  buildpacks = [
    "heroku/go"
  ]
}

# Couple staging app to staging pipeline stage
resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.devops-app.id}"
  stage    = "staging"
}

# Create a database, and configure the app to use it
resource "heroku_addon" "staging-database" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}
