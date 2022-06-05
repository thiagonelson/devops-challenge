resource "aws_ecr_repository" "jpv" {
  name                 = "jpv"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
