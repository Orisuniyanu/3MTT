# Terraform EC2 Instance and AMI Creation

In this mini project, I will use Terraform to automate the creation of an EC2 instance on AWS and then create an Amazon Machine Image (AMI) from that instance.

## Objectives

- Learn how to write basic Terraform configuration files.
- Learn how to write Terraform script to automate creation of an EC2 instance on AWS.
- Learn how to use Terraform script to automate the creation of an AMI from an already created EC2 instance on AWS.

## Prerequisites

This project reqires an AWS Account and the AWS CLI configured to it locally. This setup will used by the Terraform script I am going to write. From my local command line interface, Terraforn will use the configured AWS CLI credential to communicate with the AWS Account when executing the script.

- Ensure I have an AWS Account created and functional. Guide [here](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html) to create a new AWS account.
- Ensure I have the AWS CLI installed and configured with the credentials of my AWS Account. Here is the [guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- Ensure I have Terraform installed on my computer. [Guid here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).


## Project Tasks

### Task 1 - Confirm the Prerequisites

1. Login into my AWS Account to confirm it is functional.
![1. AWS](./IMG/1.%20AWS.png)
2. Run `aws --version` on my local terminal to confirm the AWS CLI is installed. And here's the output.
![2. AWS Version](./IMG/2.%20AWS%20Version.png)
3. Run `aws configure list` to confirm the AWS CLI is configured. Here's the output.
![3. AWS CLI](./IMG/3.%20AWS%20CLI.png)
4. Run `aws sts get-caller-identity` to verify that AWS CLI can successfully authenticate to my AWS Account. Here's the output.
![4. AWS Authenticate](./IMG/4.%20AWS%20Authenticate.png)
5. Run `terraform --version to confirm Terrraform is installed. Here's the output.
![5. Terraform Version](./IMG/5.%20Terraform%20Version.png)

### Task 2 - Developing the Terraform Script to create EC2 Instance and AMI from it

1. Create a new directory for this Terraform project.

```bash
mkdir terraform-ec2-ami

cd 5. Terraform Version
```

![6. Terraform Directory](./IMG/6.%20Terraform%20Directory.png)

2. Inside the directory, I create a new Terraform configuration file which I name `main.tf`.

```bash
vi main.tf
```

3. Then inside the file, I write the script to create an EC2 instance specifying instance type, ami, and tags. Extend this script to include the creation of an AMI from the created EC2 Instance. Below is the sample.

```hcl
provider "aws" {
  region = "us-east-1"  # Adjust this to match the region of your AWS account
}

resource "aws_instance" "my_ec2_spec" {
  ami           = "ami-02b3c03c6fadb6e2c"  # Specify a valid AMI ID for your selected region
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-created-EC2-Instance"
  }
}

resource "aws_ami_from_instance" "my_ec2_spec_ami" {
  name               = "my-ec2-ami"
  description        = "My AMI created from my EC2 Instance with Terraform script"
  source_instance_id = aws_instance.my_ec2_spec.id
}


```

![7. Main File](./IMG/7.%20Main%20File.png)

## Script Explanation

This script create an EC2 instance and create an AMI from that instance.

1. **Provider Block**

    1. `provider "aws"`: This tells Terraform to use AWS as the cloud provider.
    2. `region = "us-east-1"`: Specifies which AWS region to use.

2. **EC2 Instance Creation**
    1. `resource "aws_instance" "my_ec2_spec"`: Create an EC2 Instance.
    2. `ami = "ami-02b3c03c6fadb6e2c"`: Specifies the Amazon Machine Image ID to use for the instance.
    3. `instance_type = "t2.micro"`: Defines the EC2 Instance type.
    4. The `tag`: Block adds a name tag to the instance for identification.

3. **AMI Creation from the EC2 Instance**
    1. `resource "aws_ami_from_instance" "my_ec2_spec_ami"`: Creates an AMI from the EC2 Instance.
    2. `name = "my-ec2-ami"`: Names the new AMI
    3. `source_instance_id = aws_instance.my_ec2_spec.id`: Uses the EC2 Instance to create the AMI.

### Task 3 - Executing the Terraform Script

1. Initialize the Terraform project using

```bash
terraform init
```

![8. Terraform Init](./IMG/8.%20Terraform%20Init.png)
2. Validate the correctness of the script usinf

```bash
terraform validate
```

![9. Terraform Validate](./IMG/9.%20Terraform%20Validate.png)

3. Confirm the resource that will be created by the execution of this script using

```bash
terraform plan
```

![10. Terraform Plan](./IMG/10.%20Terraform%20Plan.png)

4. Aplly the Terraform configuration using.

```bash
terraform apply
```
![11. Terraform Apply](./IMG/11.%20Terraform%20Apply.png)

### Task 4 - Confirm Resource

Then I confirm the creation of the EC2 Instance and its AMI in my AWS Account accoding to the specified details.
![12. EC2 Instance Running](./IMG/12.%20EC2%20Instance%20Running.png)
![13. AMI](./IMG/13.%20AMI.png)

### Task 5 - Clean Up
Execute command `terraform destroy` to clean up the resource created by the script.

```bash
terraform destroy
```

![14. Terraform Destroy](./IMG/14.%20Terraform%20Destroy.png)
