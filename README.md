# KCVPC Project - Terraform AWS Infrastructure

## Introduction
This project sets up a basic AWS infrastructure using Terraform. The setup includes a VPC, subnets, route tables, internet and NAT gateways, security groups, network ACLs, and EC2 instances with NGINX and PostgreSQL installed via user data scripts.

![kcvpc-architectural-diagram](https://github.com/user-attachments/assets/4c4451aa-0d27-4c67-809b-e0859172134c)

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
- #### Project Structure
![1-file_structure](https://github.com/user-attachments/assets/37b82947-dcf7-40ae-a806-1c48ca2a209d)


#### 3. Terraform init
Run the `terraform init` command.
- #### init
![2-terraform_init](https://github.com/user-attachments/assets/eb1f2daf-4c4c-4b16-b1a7-474c2601a1c9)

#### 4. Terraform plan
Run the `terraform plan -out=tfplan -json > tfplan.json` command.
- #### plan
![3-terraform_plan_output](https://github.com/user-attachments/assets/3fc6e848-d07d-40ad-8d3a-f73346c56b61)

#### 5. Terraform apply
Run the `terrafrm apply` command.
- #### starting to deploy resources.
![4-terraform_apply_start](https://github.com/user-attachments/assets/0c7573db-cdda-47ee-820d-c406d7464ca5)
- #### finshed deployment
![5-terraform_apply_outputs](https://github.com/user-attachments/assets/00dbdc0a-1108-482f-b9df-2bdcd69a9bc5)

### Deployed Resources from Cosole.
#### 1. VPC
A VPC was created using a separate module (modules/vpc) to isolate network resources.

- #### modules/vpc/

![A-vpc](https://github.com/user-attachments/assets/806efb35-d49b-467e-84fe-048e1ce67ab8)

#### 2. Subnets
Public and private subnets were created in the modules/subnet module.

- #### modules/subnet/

![B-subnets](https://github.com/user-attachments/assets/6fc2dc2e-fb6d-4664-ae87-e2c5ec4303ae)

#### 3. Route Tables and Gateways
Route tables, internet gateway, and NAT gateway were created to manage network traffic.

- #### modules/route_table/

![C-route-tables](https://github.com/user-attachments/assets/d8803c89-30e1-43db-b0d5-427aca4e4ba1)

#### 4. Security Groups
Security groups were created to define inbound and outbound rules for EC2 instances.

- #### modules/security_group/

![G-security-groups](https://github.com/user-attachments/assets/d7ebdc7e-0c18-4e4c-8f93-028dec8a931c)


#### 5. EC2 Instances
EC2 instances were created with user data scripts to install NGINX and PostgreSQL.

- #### modules/ec2_instance/

![6-ec2_instances](https://github.com/user-attachments/assets/df23514f-907d-471f-b044-4de55c5dd9c8)

### EC2 SSH Connection
- #### public instance connect page on AWS console
![7A-ec2-1](https://github.com/user-attachments/assets/f4cf4613-8efe-4984-8a39-b794162ed06f)

- #### nginx already installed on connecting to the public instance.
![7A-nginxinstalled](https://github.com/user-attachments/assets/fb3fd53a-b8e5-4045-978b-03da9771f109)

- #### nginx page
![7A-nginxonweb](https://github.com/user-attachments/assets/1347f622-0066-48d7-84c9-10a0846f654e)


### Conclusion
This project demonstrates how to use Terraform to set up a basic AWS infrastructure with VPC, subnets, route tables, gateways, security groups, network ACLs, and EC2 instances with specific software installed via user data scripts. By organizing the configuration into modules, the setup becomes more manageable and scalable.

This `README.md` explains how the project was structured, the decisions made during the setup, and the steps to deploy and manage the infrastructure.