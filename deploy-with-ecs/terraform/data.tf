# data "aws_ecr_image" "service_image" {
#     repository_name = "${var.ecr_namespace}/${var.ecr_app_name}"
#     image_tag = "latest"
# }

data "aws_ecr_authorization_token" "japp_token" {

}
