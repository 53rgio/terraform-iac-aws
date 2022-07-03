
resource "aws_ecr_repository" "flask-webapp" {
  name                 = "flask-webapp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "flask-webapp-chart" {
  name                 = "flask-webapp-chart"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
