# KCVPC Project - Terraform AWS Infrastructure

## Introduction
This project sets up a basic AWS infrastructure using Terraform. The setup includes a VPC, subnets, route tables, internet and NAT gateways, security groups, network ACLs, and EC2 instances with NGINX and PostgreSQL installed via user data scripts.

![VPC Architecture Diagram](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/kcvpc-architectural-diagram.png)

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


#### 1. Clone the Repository

```sh
git clone https://github.com/bankole874/Terraform-VPC-setup.git
cd Terraform-VPC-setup
```

#### 2. Create the project infrastructure
To create the project files according to the desired architecture.
- Project Structure
![project Structure](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/1-file_structure.png)



#### 4. Terraform init
Run the `terraform init` command.
- initializing
![init](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/2-terraform_init.png)

#### 5. Terraform plan
Run the `terraform plan -out=tfplan -json > tfplan.json` command.
- plan
![plan](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/3-terraform_plan_output.png)

#### 6. Terraform apply
Run the `terrafrm apply` command.
- starting to deploy resources.
![apply](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/4-terraform_apply_start.png)
- finshed deployment
![applyout](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/4-terraform_apply_start.png)

### Deployed Resources from Cosole.
#### 1. Creating the VPC
A VPC was created using a separate module (modules/vpc) to isolate network resources.

- modules/vpc/

![vpc](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/A-vpc.png)

#### 2. Creating Subnets
Public and private subnets were created in the modules/subnet module.

- modules/subnet/

![subnets](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/B-subnets.png)

#### 3. Creating Route Tables and Gateways
Route tables, internet gateway, and NAT gateway were created to manage network traffic.

- modules/route_table/

![route_table](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/C-route-tables.png)

#### 4. Creating Security Groups
Security groups were created to define inbound and outbound rules for EC2 instances.

- modules/security_group/

![security_group](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/G-security-groups.png)


#### 5. Setting Up EC2 Instances
EC2 instances were created with user data scripts to install NGINX and PostgreSQL.

modules/ec2_instance/

![ec2](https://github.com/bankole874/Terraform-VPC-setup/blob/main/images/6-ec2_instances.png)

### Conclusion
This project demonstrates how to use Terraform to set up a basic AWS infrastructure with VPC, subnets, route tables, gateways, security groups, network ACLs, and EC2 instances with specific software installed via user data scripts. By organizing the configuration into modules, the setup becomes more manageable and scalable.

This `README.md` explains how the project was structured, the decisions made during the setup, and the steps to deploy and manage the infrastructure.