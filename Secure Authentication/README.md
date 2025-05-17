# Setting Up Secure Authentication to AWS API

## Introduction

Integrating securely with AWS APIs is the foundation of any automated cloud operation. Whether writing scripts to manage EC2 instances, deploying containers with CloudFormation, or building serverless applications with Lambda, every API call you make to AWS must be authenticated and authorized to ensure both functionality and security.

At its core, AWS authentication relies on Identity and Access Management (IAM). IAM enables you to create fine-grained credentials—such as access keys, roles, and temporary tokens—that govern who (or what) can call which service APIs under what conditions. 
AWS best practices follows:

- Avoid embedding lo-ng-lived credentials directly in code or configuration files.

- Leverage IAM roles and temporary security credentials (via AWS Security Token Service) to grant just-in-time permissions, reducing the blast radius if a credential is compromised.

- Enforce multi-factor authentication (MFA) for sensitive operations and rotate any necessary long-lived keys regularly.

In this guide, I’ll cover how to:

1. **Create an IAM Role:** Begin by establishing an IAM role that encapsulates the permission required for the operations our script will perform.

2. **Create an IAM Policy:** Design an IAM policy granting full access to both EC2 and S3 services. This policy ensures our script has the necessary permissions to manage these resources.

3. **Create an IAM User:** Instantiate an IAM user named automation_user. This user will serve as the primary entity our script uses to interact with AWS services.

4. **Assign the User to the IAM Role:** Link the automation_user to the perviously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for our automation tasks.

5. **Attach the IAM Policy to the User:** Ensure that the automation_user is explicitly granted the permissions defined in our IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

6. **Create Programmatic Access Credentials:** Generate programmatic access credentials-specifically, an **access key ID** and a **secret access key** for **automation_user**. These credentails are indispensable for authenticating our script with the AWS API through the Linux terminal, allowing it to create and manage cloud resources programmatically.

## Installing and Configuring the AWS CLI

After setting up AWS account and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI). The AWS CLI is a powerful tool that allows you to interact with AWS services directly from your terminal, enabling autimation and simplification of AWS resource management.

## Downloading and Installing AWS CLI

1. I will be installing AWS CLI on my Linux environmet which is RedHat.
2. I open the terminal with `Putty`
![1. Putty](./IMG/1.%20Putty.png)
3. Then I download the AWS CLI version 2 installtion file for Linux with this URL
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```
4. Then after downloading the package I unzip it before I can install it properly.
```bash
unzip awscliv2.zip
```
5. Then I run the installer with the following command.
```bash
sudo ./aws/install
```
6. Then I run the command below to verify the installation,  if AWS CLI is installed properly.
```bash
aws --version
```
![2. AWS CLI](./IMG/2.%20AWS%20CLI.png)

## Configuring the AWS CLI

Once the AWS CLI is installed, the next step is to configure it to use the **access key ID** and **secret access key** generated for your **automation_user**.
This is authenticate your CLI (Command Line Interface) requests to the AWS API.

**What is APIs**
**API (Application Programming Interface)** - is a set of protocol and tools that allows different software here. An API is a set of protocol and tools that allows different software applications to communicate with each other. In the context of AWS, the AWS API enables your scirpts or the AWS CLI to interact with AWS services programmatically. This means you can create, modify, and delete AWS resources by making API calls, which are just structured requests that the AWS platfrom can understand and act upon.

**Configurating AWS CLI for access to AWS:**

1. Still on my Linux terminal, I run this command
```bash
aws configure
```
This command initiates the setup process for your AWS CLI installtion.
2. Then I enter my credentials when it prompted me, I enter my **AWS Access Key** and **AWS Secret Access Key** for the automation_user. 
3. Next was to specify the default **region** name and default **output** format. 
![3. Secret Details](./IMG/3.%20Secret%20Details.png)
Then I run this command to see all my configuration on the AWS CLI
```bash
aws sts get-caller-identity
```
![5. My Details](./IMG/5.%20My%20Details.png)

## Testing the Configuration:

To verify my AWS CLI is configured correctly and can communicate with AWS service, I try running a basic command that will list all the AWS regions:

```bash
aws ec2 describe-regions --output table
```
![4. Region](./IMG/4.%20Region.png)
