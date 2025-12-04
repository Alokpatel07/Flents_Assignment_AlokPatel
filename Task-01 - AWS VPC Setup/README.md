# Task 1 – AWS VPC Networking Setup

### Objective
Create a basic AWS network architecture using Terraform that includes:
- One VPC
- Two Public Subnets
- Two Private Subnets
- Internet Gateway for public subnet access
- NAT Gateway for private subnet outbound internet access
- Separate Route Tables for Public and Private subnets

---

###  VPC Design

| Component        | Name                 | CIDR              | Availability Zone
| VPC              | Alok_Patel_VPC       | 192.168.0.0/16 
| Public Subnet 1  | dev01_public_subnet  | 192.168.0.0/20    | us-east-1a
| Public Subnet 2  | dev02_public_subnet  | 192.168.16.0/20   | us-east-1b
| Private Subnet 1 | dev01_private_subnet | 192.168.32.0/20   | us-east-1c
| Private Subnet 2 | dev02_private_subnet | 192.168.48.0/20   | us-east-1d

---

###  Why these CIDR ranges?

- **192.168.0.0/16** gives ~65,536 IP addresses which is flexible for future expansion of subnets.
- Each subnet uses **/20** (4096 IPs) — best practice for small public/private workloads.
