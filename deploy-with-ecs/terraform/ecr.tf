resource "aws_ecr_repository" "cnc_ecr" {

  name                 = "${var.ecr_namespace}/${var.ecr_app_name}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
  }
}
