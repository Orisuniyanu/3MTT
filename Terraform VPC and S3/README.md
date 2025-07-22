# Terraform Modules - VPC and S3 Bucket with Backend Storage

## Purpose

In this mini project, I will use Terraform to create modularized configurations for building and Amazon Virtual Private Cloud (VPC) and an Amazon S3 bucket. Additionally, I will configure Terraform to use Amazon S3 as the backend storage for storing the Terraform state file.

## Objectives

1. **Terraform Modules:**

- Learn how to create and use Terraform modules for modular infrastructure provisioning.

2. **VPC Creation:**

- Build a reusable Terraform module for creating a VPC with specfied configurations.

3. **Backend Storage Configuration:**

- Configure Terraform to use Amazon S3 as the backend storage for storing the Terraform state file.

## Project Tasks

1. Create a new directory for my Terraform project `terraform-modules-vpc-s3`.

2. Inside the project directory, create a directory for the VPC module `modules/vpc`.
![1. New Directory](./IMG/1.%20New%20Directory.png)
3. Write a Terraform module which I name the file `main.tf` for creating VPC with customizable configurations such as CIDR block, subnets, etc.

```tf
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}
```

4. Still inside the same directory I create another file which will serves as my variable file for VPC creation.

```bash
vi variables.tf
```

```tf
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}
```

![2. VPC Main File](./IMG/2.%20VPC%20Main%20File.png)

## Task 2: S3 Bucket Module

1. Inside the project directory, create another directory for the S3 bucket module `modules/s3`.

2. Write a Terraform module `modules/s3/main.tf` for creating an S3 bucket with customizable configuration such as bucket name, ACL, etc.

3. Modify the main Terraform configuration file `main.tf` to use the S3 module and create an S3 bucket.

```tf
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = {
    Name = var.bucket_name
  }
}
```

4. Also create varibles file for S3 bucket

```bash
vi variables
```

```tf
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply"
  type        = string
}
```

![3. S3 Bucket](./IMG/3.%20S3%20Bucket.png)

## Task 3: Backend Storage Configuration

1. Configure Terraform to use Amazon S3 as the backend storage for storing the Terraform state file.

2. Create a backend configuration file `backend.tf` specifying the S3 bucket and key storing state.

3. Initialize the Terraform project using the command

```tf
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "your-lock-table"
  }
}
```

## Task 4: Root files

So at the root I create the folloewing file

1. backend.tf

```bash
vi backend.tf
```

```tf
terraform {
  backend "s3" {
    bucket         = "terraform-state-iyanu-20250722"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "your-lock-table"
  }
}
```

2. provider.tf

This is where I specify the provider I want to use for this project which is `aws`.

```bash
vi provider.tf
```

```tf
---
provider "aws" {
  region = var.aws_region
}
```

3. main.tf

This is my main configuration

```bash
vi main.tf
```

```tf
---
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
  vpc_name   = var.vpc_name
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  acl         = var.bucket_acl
}
```

4. variables.tf

This is the variables I will pass to other file configurations.

```bash
vi variables.tf
```

```tf
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "bucket_acl" {
  description = "ACL for the S3 bucket"
  type        = string
  default     = "private"
}
```

5. terraform.tfvars

This is where I will be defining all the variable which will make it easy for other people to edit and use my configurations/ script.

```bash
vi terraform.tfvars
```

```tf
aws_region  = "us-east-1"
vpc_cidr    = "10.0.0.0/16"
vpc_name    = "MyCustomVPC"
bucket_name = "my-unique-bucket-name-12345"
bucket_acl  = "private"
```

![4. Root Files](./IMG/4.%20Root%20Files.png)
![5. Variable Files](./IMG/5.%20Variable%20Files.png)

## How to apply

1. After getting all my script ready I ran this command.

```bash
terraform init
```

![6. Terraform Init](./IMG/6.%20Terraform%20Init.png)

```bash
terraform validate

terraform plan
```

![7. Terraform Validate and Plan](./IMG/7.%20Terraform%20Validate%20and%20Plan.png)

```bash
terraform apply
```

![8. Terraform Apply](./IMG/8.%20Terraform%20Apply.png)

2. Check the output on the aws portal.

![9. Terraform S3 Bucket](./IMG/9.%20Terraform%20S3%20Bucket.png)

![10. Terraform VPC](./IMG/10.%20Terraform%20VPC.png)