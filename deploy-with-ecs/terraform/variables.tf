variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "public_subnet"
  type        = list(string)
  default     = ["10.0.1.0/28", "10.0.20.0/28"] # add more if needed
}

variable "private_subnet_cidr" {
  description = "private_subnet"
  type        = list(string)
  default     = ["10.10.1.0/28", "10.10.20.0/28"] # add more if needed
}
