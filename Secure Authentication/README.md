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

## Create an IAM Policy
1. I begin with logging in to my AWS Management console with a user that has administrative privilege which is **Orisun**.
![6. Log in](./IMG/6.%20Log%20in.png)
2. After I successful log in, I search for **IAM** then click on **Policy**, then click on **Create policy**
![10. Create Policy](./IMG/10.%20Create%20Policy.png)
3. Then under **Specify permissions** I select both `EC2 and S3`, then click on **Next**.
![11. Specify permissions](./IMG/11.%20Specify%20permissions.png)
4. Then I give my policy **name** as `development-team-policy` and **description** as `This policy is for Development to allow to perform differedifferent activities on both EC2 and S3 Resources` then click on **Create policy** below the page.
5. After that my policy was successfully created, on the policy page under **filter by type** I select **Customer managed** then I was able to my the policy I create.
![13. Policy Created](./IMG/13.%20Policy%20Created.png)

## Create an IAM Role
2. Still on **IAM dashboard** then click on `Roles` at the left side, then click on `Create role`.
![7. Create Role](./IMG/7.%20Create%20Role.png)
3. Then on the next page I select **AWS Service**
![8. AWS Service](./IMG/8.%20AWS%20Service.png)
4. And I also **EC2** under `Use case` then click on **Next**
![9. EC2](./IMG/9.%20EC2.png)
4. Then the next page I select the policy I create in the previous section.
![14. Add Policy](./IMG/14.%20Add%20Policy.png)
5. Then I give it a name which is **IAM_Service**, then click on **Create role**
![15. Role Name](./IMG/15.%20Role%20Name.png)
6. And it was a success.
![16. Successful](./IMG/16.%20Successful.png)

## Create an IAM User

1. Still on **IAM dashboard** then click on `Users` at the left side, then click on `Create user`.
![17. Create User](./IMG/17.%20Create%20User.png)
2. Then name the user **automation_user** and also I uncheck the box to **Provide user access to the AWS Management Console**, because this user will only access the AWS Management console through the AWS CLI, then click on **Next**.
![18. Automatic User](./IMG/18.%20Automation_user.png)
3. The step 2, I select **Attach policies directly** then select the policy I create in the last section.
![19. Add Policy](./IMG/19.%20Add%20Policy.png)
4. Then I click on **Create user** Here's the result.
![20. User Created](./IMG/20.%20User%20Created.png)
5. After I create a access key for the user which is **automaic_user**
![21. Create Permission](./IMG/21.%20Create%20Permission.png)
6. After that my Access key and Secret access was created which I copied for the configuration of AWS CLI.
![22. Access Key](./IMG/22.%20Access%20Key.png)

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
