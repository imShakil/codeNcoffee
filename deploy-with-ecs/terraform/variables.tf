variable "region" {
  description = "aws-region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ecr_namespace" {
  description = "aws_ecr_repository"
  type        = string
  default     = "imshakil"
}

variable "ecr_app_name" {
  description = "aws_ecr_repository app name"
  type        = string
  default     = "japp-test"
}

# variable "cnc-vpc-cidrs" {

# }
