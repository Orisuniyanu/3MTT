# Configuring Auto Scaling with ALB using Launch Template

## Introduction
In this project I will work on Configuring Auto Scaling in AWS with an Application Load Balancer (ALB) using a Launch Template. The project aims to demonstrate the automatic scaling of EC2 instance based on demand, while leveraging benefits of a Launch Template.

**Objectives:**

1. **Create Launch Template:** Learn how to create a Launch Template with the required specifications.

2. **Set Up Auto Scaling Group:** Configure an auto scaling group to manage the desired number of EC2 instances using the Launch Template.

3. **Configure Scaling Policies:** Set up scaling policies to adjust the number of instances based on demand.

4. **Attach ALB to Auto Scaling Group:** Connect the Auto Scaling group to an existing ALB.

5. **Test Auto Scaling:** Verify that the Auto Scaling group adjusts the number of instances in response to changes in demand.

## Project Tasks:

## Task 1: Create Launch Template

1. I log in to my AWS Management Console
2. Then navigate to EC2 service.
3. On the left navigation pane, I click on "Launch Template"
![4. Launch Template](./IMG/1.%20Launch%20Template.png)
4. Then I start filling the neccessary space as follows:
- `Launch template name` -- **Mytemplate**
- `Template version description` -- **A production webserver**
![4. Template Name](./IMG/2.%20Template%20Name.png)
- `Amazon Machine Image (AMI) -- Ubuntu Server 24.04 LTS (HVM), SSD Volume Type which is a free tier version.
![3. Ubuntu Template](./IMG/3.%20Ubuntu%20Template.png)
- `Instance type` -- **t2.micro**
- `Key pair (login)` -- **aws_key**
![4. Instance Type](./IMG/4.%20Instance%20Type.png)
Network settings 
- `Subnet` -- subnet-05ad4a08614eac275, I select an existing subnet I already configured before
- `Common security groups` -- **launch-wizard-1  sg-07a6b03fbeef74da0** This is also an existing security group
![5. Network Setting](./IMG/5.%20Network%20Setting.png)
Storage (volumes) 
- `EBS Volumes` -- Volume 1 (AMI Root) : 8 GiB, EBS, General purpose SSD (gp3)
![6. Storage Volume](./IMG/6.%20Storage%20Volume.png)
- `User data - optional` --
```bash 
#!/bin/bash
echo "Hello from User Data!" > /home/ec2-user/hello.txt
```
![7. User Data](./IMG/7.%20User%20Data.png)
5. Then I click on **Create launch template**.
Here's the comfirmation of the template creation.
![8. Success](./IMG/8.%20Success.png)


## Task 2: Set Up Auto Scaling Group

1. Still on the EC2 dashboard, I click on **Auto Scaling Groups** then I click on **Create Auto Scaling Groups**.
![9. Auto Scaling Groups](./IMG/9.%20Auto%20Scaling%20Groups.png)
2. Then I fill the following details:
- `Auto Scaling group name` -- **My_Auto_Scaling**
- `Launch template` -- **Mytemplate**, which is the template I create in the previous task.
Then I click on **Next**
Then on the next page I select the VPC I want to use 
- `VPC` -- **vpc-0df75ee2f27244ae9**
- Subnet
![13. Subnet](./IMG/13.%20Subnet.png)
- Policy
![12. Policy](./IMG/12.%20Policy.png)
Then I click on **Next**
- `Desired capacity` -- **2**
- `Scaling` 
        min desired capacity as 1 while max desired capacity as 2
![10. Scaling](./IMG/10.%20Scaling.png)
Then lastly I click on **Create Auto Scaling group**
![11. Success](./IMG/11.%20Success.png)

## Task 3: Configure Scaling Policies

1. In the Auto Scaling Group, I navigate to **Scaling policies** section.
2. Under Policies I configure for scaling in and scaling out based on demand.
![12. Policy](./IMG/12.%20Policy.png)

## Task  4: Attach ALB to Auto Scaling Group

1. In the Auto Scaling group configuration, I navigate to "Load balancing" section.
Then edit the Load balancer option
![14. Load Balancer](./IMG/14.%20Load%20Balancer.png)
Then click on **Update**

## Task 5: Test Auto Scaling

1. I run this command to test the Auto Scale group 
```bash
        sudo amazon-linux-extras install epel -y
        sudo yum install stress -y

        stress -c 4 

```
