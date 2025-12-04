# 🚀 EC2 Instance Creation using Terraform (AWS)

This project launches an **Amazon EC2 instance** using **Terraform** in an existing VPC and subnet on AWS.

## 📌 Resource Details

The following resources were used in this setup:

| Resource | Value |
|------|------|
| **VPC ID** | `vpc-00e23db72a32e42b9` |
| **Subnet ID** | `subnet-0b6a2ee2ce544cfe8` |
| **AMI ID** | `ami-0fa3fe0fa7920f68e` |
| **AMI Name** | `al2023-ami-2023.9.20251117.1-kernel-6.1-x86_64` |
| **Instance Type** | `t2.micro` |
| **Key Pair** | `AlokPatelECServerKP` |
| **Security Group** | `sg-051e0f7ffe21fbbd6` |
| **Region** | `us-east-1 (N. Virginia)` |
| **EC2 Name Tag** | `AlokPatelEC2Server` |


---


## Basic Infrastructure Hardening (AWS Best Practices)

**IAM & Access**
- Use IAM Roles for EC2 

**Security Groups**
- Allow HTTP (80) to public only if needed
- Restrict SSH (22) to *your IP only*
- Block all unused ports

**OS Hardening**
- Keep Amazon Linux & Nginx updated

**Backups**
- Take regular EBS snapshots
- Don’t store sensitive data on EC2

**Monitoring**
- Enable CloudWatch logs & metrics

**Key Management**
- Use SSH key pair (no password login)



### EC2 Screenshot AWS
![EC2](https://github.com/Alokpatel07/Flentas_Assignment_AlokPatel/blob/main/Task-02-EC2%20Static%20Website%20Hosting/SS/EC2_Instance.png)

### Security Group created with port 80 and 22 opened
![Security Group](https://github.com/Alokpatel07/Flentas_Assignment_AlokPatel/blob/main/Task-02-EC2%20Static%20Website%20Hosting/SS/SecurityGroup.png)

### Installing NGINX and Configuring it
![NGINX COnfiguration](https://github.com/Alokpatel07/Flentas_Assignment_AlokPatel/blob/main/Task-02-EC2%20Static%20Website%20Hosting/SS/Install-and-Configure-NGINX.png)

### Resume Hosted as a Static Website in NGINX
![Resume Hosted](https://github.com/Alokpatel07/Flentas_Assignment_AlokPatel/blob/main/Task-02-EC2%20Static%20Website%20Hosting/SS/ResumeHostedinNGINX.png)