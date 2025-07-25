# Mini Project: EC2 Module and Security Group Module with Apache2 and UserDate

## Purpose

In this project I will use Terraform to create modularized configurationd for deploying an EC2 instance with a specified Security Group and Apache2 installed using UserData.

## Objectives

1. **Terraform Module Creation:**
Creating Terraform modules for modular infrastructure provisioning.

2. **EC2 Instance Configuration:**
Configure Terraform to create an EC2 instance.

3. **Security Group Configuration:**
Create a separate module for Security Group associated with the EC2 instance.

4. **UserDate:**
Utilize UserDate to install and configure Apache2 on the EC2 instance.

## Project Tasks:

## Task 1: EC2 Module

1. the first I check is to see if I have `aws cli` installed on my local machine.

```bash
aws version
```

2. I create a new directory for this project and also creat another directories for ec2 modules.

```bash
mkdir terraform-ec2-apache

cd terraform-ec2-apache

mkdir -p modules/ec2
```

![1. AWS Version](./IMG/1.%20AWS%20Version.png)

3. Then inside that ec2 module directory I create main.tf, varibles.tf and outputs.tf files where I define my terraform script.

```bash
# vi modules/ec2/main.tf

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  user_data              = var.user_data

  tags = {
    Name = "Apache2-Instance"
  }
}
```

```bash
# modules/ec2/variables.tf

variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "user_data" {}
```

```bash
# modules/ec2/outputs.tf

output "public_ip" {
  value = aws_instance.this.public_ip
}
```

## Task 2: UserData Scritp

1. Inside the root directory I create another file which is `apache_userdata.sh`

```bash
# vi modules/ec2/apache_userdate.sh

#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Apache2 is Running on $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
```

2. After creating the file then I add permission to be executable 

```bash
chmod +x apache_userdata.sh
```

![3. Permission](./IMG/3.%20Permission.png)

## Task 3: Security Group Module

1. Inside the project directory I create a directory for Security Group module, which is `modules/secruity_group`.

```bash
mkdir -p modules/secruity_group

cd modules/secruity_group
```

2. Then I also write Terraform module to create a Security Group for the EC2 instance.

```bash
vi modules/secruity_group/main.tf

resource "aws_security_group" "this" {
  name        = var.sg_name
  description = "Allow web and SSH"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

```bash
# vi variables.tf

variable "sg_name" {}
variable "vpc_id" {}
variable "ingress_ports" {
  type = list(number)
}
```

```bash
# outputs.tf

output "sg_id" {
  value = aws_security_group.this.id
}
```

## Task 4 Main Terraform Configuration

1. Then at the root level of the project directory I create the following files.

```bash
# vi main.tf

provider "aws" {
  region = var.region
}

module "network" {
  source            = "./modules/network"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

module "security_group" {
  source        = "./modules/security_group"
  sg_name       = "apache-sg"
  vpc_id        = module.network.vpc_id
  ingress_ports = [80, 22]
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = var.subnet_id
  security_group_ids = [module.security_group.sg_id]
  user_data          = file("userdata.sh")
}
```

```bash
# variables.tf

variable "region" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
```

```bash
# terraform.tfvars

region         = "us-east-1"
ami_id         = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 LTS
instance_type  = "t2.micro"
key_name       = "terraform-key"
```

```bash
# outputs.tf

output "public_ip" {
  value = module.ec2.public_ip
}
```

![2. Tree](./IMG/2.%20Tree.png)

## Task 5: Network Module

Then I also create another for network

```bash
# modules/network/main.tf
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
```

```bash
# modules/network/variables.tf
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "availability_zone" {}
```

```bash
# modules/network/outputs.tf

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id" {
  value = aws_subnet.this.id
}
```

## Tasl 5: Deployment

After creating the neccesary files need for this project then the following tasks take place.

1. Initializing the terraform to download all the reqiure provider.

```bash
terraform init
```

![4. Terraform Init](./IMG/4.%20Terraform%20Init.png)

2. Then I check if all my syntax are correct with.

```bash
terraform validate
```

3. Then I apply after the validate is success.
![5. Terraform Apply](./IMG/5.%20Terraform%20Apply.png)

4. Then I copied the public ip I got from the output and paste it to my browser to see if the apache is running because if is not running I will not see the content on my browser.
![6. Browser](./IMG/6.%20Browser.png)





