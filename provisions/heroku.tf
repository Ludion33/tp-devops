# Configure the Heroku provider
provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

variable "heroku_email" {
    type = "string"
}
variable "heroku_api_key" {
    type = "string"
}

# Create a Heroku pipeline
resource "heroku_pipeline" "devops-app" {
  name = "devops-app"
}





