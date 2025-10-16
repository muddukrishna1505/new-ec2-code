# 🚀 Terraform EC2 Instance Setup

This repository contains a Terraform configuration that provisions an **AWS EC2 instance** (Amazon Linux 2023) with customizable parameters such as VPC, subnet, and security group.

---

## 🧱 Features

- 🌩️ Launches an EC2 instance on AWS  
- 🧩 Uses **Amazon Linux 2023** AMI (latest version)  
- 🔑 Supports custom SSH key pair and security group  
- 🌐 Optionally attaches a public IP for internet access  
- ⚙️ Easy to modify variables for reusability  

---

## 📂 Project Structure

terraform-ec2/
├── main.tf # Main Terraform configuration (EC2, SG, etc.)
├── variables.tf # Input variables (region, instance_type, etc.)
├── output.tf # Output values (instance_id, public_ip)
├── terraform.tfvars # Variable values (not committed to GitHub)
├── .gitignore # Ignored files (state, keys, etc.)
└── README.md # Documentation


## ⚙️ Prerequisites

Before running this Terraform configuration, ensure you have:

1. **AWS account** with permissions to create EC2 instances  
2. **Terraform** installed (v1.5+ recommended)  
   ```bash
   terraform -version
AWS CLI configured with your credentials:

bash
Copy code
aws configure
An existing Key Pair in AWS (e.g., krish.pem)

🚀 Usage
1️⃣ Initialize Terraform
bash
Copy code
terraform init
2️⃣ Validate Configuration
bash
Copy code
terraform validate
3️⃣ Preview Changes
bash
Copy code
terraform plan
4️⃣ Apply and Create Resources
bash
Copy code
terraform apply -auto-approve
5️⃣ View Outputs
bash
Copy code
terraform output
You’ll see details like:

ini
Copy code
instance_id = "i-0a12345b6cdef7890"
public_ip   = "18.205.100.200"
🔐 Example terraform.tfvars
h
Copy code
region             = "us-east-1"
instance_type      = "t2.micro"
key_name           = "krish"
subnet_id          = "subnet-0123456789abcdef"
security_group_id  = "sg-0123456789abcdef"
⚠️ Do NOT commit your .tfvars file if it contains sensitive info.

🌐 Connect to EC2 Instance
Once the instance is running, connect via SSH:


ssh -i "krish.pem" ec2-user@<public-ip>
🧰 Destroy Resources
To delete all resources created by Terraform:


terraform destroy -auto-approve
