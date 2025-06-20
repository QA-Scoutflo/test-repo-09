output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "The private IP address of the EC2 instance."
  value       = aws_instance.this.private_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance (if applicable)."
  value       = aws_instance.this.public_dns
}

output "security_group_id" {
  description = "The ID of the security group attached to the instance."
  value       = aws_security_group.instance_sg.id
}
