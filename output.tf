output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.jenkins_server.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.jenkins_server.public_ip
}

output "private_ip" {
  description = "Private IP of the instance"
  value       = aws_instance.jenkins_server.private_ip
}
