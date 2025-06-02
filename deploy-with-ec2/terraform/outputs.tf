output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.cnc_alb.dns_name
}

output "aws_ec2_instance_public_ip" {
  description = "EC2 instances public IP"
  value       = [for instance in aws_instance.cnc_instance : instance.public_ip]
}
