output "ecr_app_name" {
    description = "ecr registry name"
    value = aws_ecr_repository.cnc_ecr.repository_url
}

output "token" {
    value = data.aws_ecr_authorization_token.japp_token.authorization_token
    sensitive = true
}
