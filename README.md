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

### 1. Clone the Repository

```sh
git clone https://github.com/bankole874/Terraform-VPC-setup.git
cd Terraform-VPC-setup
```

### 2. Initialize Terraform

```
terraform init
```

### 3. Apply the Terraform Configuration

```
terraform apply
```

### 4. Access the Instances
SSH into the instances using the public IP address of the EC2 instances.

For the public instance:

```
ssh -i ~/.ssh/id_rsa ec2-user@<public_instance_ip>
```
For the private instance, you can SSH into the public instance first, and then SSH into the private instance from there.

5. Clean Up
To destroy the infrastructure created by Terraform:

sh
Copy code
terraform destroy -var="ssh_key_name=id_rsa" -var="ssh_key_path=~/.ssh/id_rsa.pub"
Variables
The following variables can be configured in variables.tf:

ssh_key_name: The name of the SSH key pair (default: id_rsa)
ssh_key_path: Path to the SSH public key file (default: ~/.ssh/id_rsa.pub)
public_subnet_id: The ID of the public subnet
private_subnet_id: The ID of the private subnet
public_security_group_id: The ID of the public security group
private_security_group_id: The ID of the private security group
Outputs
The following outputs are provided:

public_instance_id: The ID of the public EC2 instance
private_instance_id: The ID of the private EC2 instance
vpc_id: The ID of the VPC
public_subnet_id: The ID of the public subnet
private_subnet_id: The ID of the private subnet
 
## Conclusion
This guide has provided a comprehensive walkthrough to set up a secure and functional VPC in AWS with both public and private subnets, proper routing, and security configurations. By following these steps, you have created a robust network architecture suitable for various applications.