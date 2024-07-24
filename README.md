# KCVPC Project - Terraform AWS Infrastructure

## Introduction
This project sets up a basic AWS infrastructure using Terraform. The setup includes a VPC, subnets, route tables, internet and NAT gateways, security groups, network ACLs, and EC2 instances with NGINX and PostgreSQL installed via user data scripts.
 
## Architecture Diagram
![VPC Architecture Diagram](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/kcvpc-architectural-diagram.png)

## Project Structure
![project Structure](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/1-file_structure.png)

## Components Explanation
 
- **VPC (Virtual Private Cloud)**: A logically isolated section of the AWS cloud where you can launch AWS resources in a virtual network.
- **Subnets**:
  - **Public Subnet**: A subnet that has a route to an internet gateway, making its resources accessible from the internet.
  - **Private Subnet**: A subnet that does not have a direct route to the internet.
- **Internet Gateway (IGW)**: A horizontally scaled, redundant, and highly available VPC component that allows communication between instances in KCVPC and the internet.
- **NAT Gateway**: Allows instances in a private subnet to connect to the internet or other AWS services, but prevents the internet from initiating a connection with those instances.
- **Route Tables**:
  - **Public Route Table**: Directs internet traffic to the IGW.
  - **Private Route Table**: Routes internet traffic to the NAT Gateway.
- **Security Groups**: Virtual firewalls that control inbound and outbound traffic for your instances.
- **Network ACLs (NACLs)**: Provide an additional layer of security for your VPC by controlling traffic to and from one or more subnets.
 
## Step-by-Step Guide


## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI installed and configured with appropriate credentials
- An SSH key pair available locally ( `id_rsa` and `id_rsa.pub` in `~/.ssh/`) using the `ssh-keygen` command.

3. Creating the VPC
A VPC was created using a separate module (modules/vpc) to isolate network resources:

modules/vpc/main.tf:


4. Creating Subnets
Public and private subnets were created in the modules/subnet module:

modules/subnet/main.tf:


5. Creating Route Tables and Gateways
Route tables, internet gateway, and NAT gateway were created to manage network traffic:

modules/route_table/main.tf:


6. Creating Security Groups
Security groups were created to define inbound and outbound rules for EC2 instances:

modules/security_group/main.tf:


7. Setting Up EC2 Instances
EC2 instances were created with user data scripts to install NGINX and PostgreSQL:

modules/ec2_instance/main.tf:


8. Adding SSH Key Configuration
The SSH key pair was configured to allow SSH access to EC2 instances:

provider.tf:


9. Writing User Data Scripts
User data scripts for installing NGINX and PostgreSQL were placed in the scripts directory:

scripts/install_nginx.sh:


Initialize Terraform:


For the public instance:


Destroy the infrastructure:


Conclusion
This project demonstrates how to use Terraform to set up a basic AWS infrastructure with VPC, subnets, route tables, gateways, security groups, network ACLs, and EC2 instances with specific software installed via user data scripts. By organizing the configuration into modules, the setup becomes more manageable and scalable.

This `README.md` explains how the project was structured, the decisions made during the setup, and the steps to deploy and manage the infrastructure.