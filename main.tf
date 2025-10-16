# -----------------------------
# EC2 Instance Creation
# -----------------------------
resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = true

#User data runs automatically on first boot
  user_data = <<-EOF
              #!/bin/bash
              # Update system
              sudo yum update -y

              # Install Java (required for Jenkins)
              sudo amazon-linux-extras install java-openjdk17 -y

              # Add Jenkins repo and import key
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

              # Install Jenkins
              sudo yum install jenkins -y

              # Enable and start Jenkins
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              EOF

  tags = {
    Name        = "Jenkins-Server"
    Environment = "prod"
    ManagedBy   = "Terraform"
  }
}

