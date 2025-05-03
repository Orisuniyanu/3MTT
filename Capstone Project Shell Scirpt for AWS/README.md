# Shell Script for AWS IAM Management

## Introduction 

This Capstone project will demostrate how I will use script to automate the process of managing AWS Identity and Access Management (IAM) resources. This includes the creation of users, user groups, and the assignment of permissions for new hires, especially for their DevOps team.

## Project Scenario
CloudOps Solutions is a growing company that recently adopted AWS to manage its cloud infrastructure. As the company
scales, they have decided to automate the process of managing AWS Identity and Access Management (IAM) resources. This
includes the creation of users, user groups, and the assignment of permissions for new hires, especially for their DevOps team.


## STEPS

1. I start my Ubuntu VM sitting on Oracle Virtual Box
2. Then connect to the VM through **Putty** application.
![1. Putty](./IMG/1.%20Putty.png)
3. Then I check my configuration with AWS CLI on my terminal.
```bash
aws sts get-caller-identity
````
And this was the result
```bash
{
    "UserId": "AIDAYLC7MJPESV7RVIVZV",
    "Account": "573578169289",
    "Arn": "arn:aws:iam::573578169289:user/orisun"
}
```
![3. Terminal Result](./IMG/3.%20Terminal%20Result.png) 
in json format

4. Then I make sure that this user **orisun** has the admin permission to take out the tasks in this Capstone project.
![2. Orisun Admin](./IMG/2.%20Orisun%20Admin.png)
5. Then I create a new directory in **iyanu** home directory to orgainzied my work which I named **AWS_CLI.**
```bash
mkdir AWS_CLI && cd AWS_CLI
```
![4. AWS_CLI](./IMG/4.%20AWS_CLI.png)

6. Then I create a new file inside the AWS_CLI directory that will store all the bash commands to run on the AWS environment which I named **aws-iam-manager.sh**.
```bash
 vim aws-iam-manager.sh
```
7. This is the content inside my file.
```bash
#!/bin/bash

# AWS IAM Manager Script
# Automates the creation of IAM users, group ("admin"), and policy assignment.

# 1. Define array of IAM usernames
IAM_USERS=("David" "Musa" "Debbi" "Joseph" "Jonah")

# 2. Function to create IAM users
create_iam_users() {
    for USER in "${IAM_USERS[@]}"; do
        echo "Creating IAM user: $USER ..."
        aws iam create-user --user-name "$USER" 2>/dev/null
        echo "IAM user '$USER' created successfully."
    done
}

# 3. Function to create IAM group named "admin"
create_admin_group() {
    aws iam get-group --group-name "admin" &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Group 'admin' already exists."
    else
        aws iam create-group --group-name "admin"
        echo "Group 'admin' created."
    fi
}

# 4. Function to attach AdministratorAccess policy to "admin" group
attach_admin_policy() {
    aws iam get-group --group-name "admin" &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Error: Group 'admin' does not exist. Cannot attach policy."
        return 1
    fi

    aws iam attach-group-policy \
        --group-name "admin" \
        --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess"
    echo "Success: AdministratorAccess policy attached to group 'admin'."
}

# 5. Function to add users to "admin" group
add_users_to_admin_group() {
    for USER in "${IAM_USERS[@]}"; do
        echo "Adding user '$USER' to 'admin' group..."
        aws iam add-user-to-group --user-name "$USER" --group-name "admin"
        echo "User '$USER' added to group 'admin'."
    done
}

# Ensure AWS CLI is installed before proceeding
if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI is not installed. Please install and configure it first."
    return 1 2>/dev/null || exit 1
else
    echo "AWS CLI is installed and ready. Proceeding with IAM setup..."

    # Call functions in order
    create_admin_group
    attach_admin_policy
    create_iam_users
    add_users_to_admin_group
fi
```
## Explaining the Script
- **Function 1**: I list all the user name I want to create as an array with **IAM_USERS** name.
- **Function 2**: Creating the user listed in the array.
- **Function 3**: Creating **Admin** group but check if the group exist or not.
- **Function 4**: Granting the admin group admin premission
- **Function 5**: Adding all the users in the array to admin group with the admin permission.
- **Function 6**: Checking if AWS CLI is installed on the environment that want to execute the bash script before attempt to carry out the functions, also list the order that which the tasks should be carry out.

7. Then I give the owner permission to execute the bash script.
```bash
chmod u+x aws-iam-manager.sh
```
![5. Chmod](./IMG/5.%20Chmod.png)
8. Then I run the script.
```bash
./aws-iam-manager.sh
```
9. Then this is the output om the terminal
```bash
AWS CLI is installed and ready. Proceeding with IAM setup...
{
    "Group": {
        "Path": "/",
        "GroupName": "admin",
        "GroupId": "AGPAYLC7MJPER7ODVTJY2",
        "Arn": "arn:aws:iam::573578169289:group/admin",
        "CreateDate": "2025-05-03T20:51:10+00:00"
    }
}
Group 'admin' created.
Success: AdministratorAccess policy attached to group 'admin'.
Creating IAM user: David ...
{
    "User": {
        "Path": "/",
        "UserName": "David",
        "UserId": "AIDAYLC7MJPEU27RCA2F6",
        "Arn": "arn:aws:iam::573578169289:user/David",
        "CreateDate": "2025-05-03T20:51:17+00:00"
    }
}
IAM user 'David' created successfully.
Creating IAM user: Musa ...
{
    "User": {
        "Path": "/",
        "UserName": "Musa",
        "UserId": "AIDAYLC7MJPE4K4XKQRDW",
        "Arn": "arn:aws:iam::573578169289:user/Musa",
        "CreateDate": "2025-05-03T20:51:19+00:00"
    }
}
IAM user 'Musa' created successfully.
Creating IAM user: Debbi ...
{
    "User": {
        "Path": "/",
        "UserName": "Debbi",
        "UserId": "AIDAYLC7MJPE2J6UL35WK",
        "Arn": "arn:aws:iam::573578169289:user/Debbi",
        "CreateDate": "2025-05-03T20:51:22+00:00"
    }
}
IAM user 'Debbi' created successfully.
Creating IAM user: Joseph ...
{
    "User": {
        "Path": "/",
        "UserName": "Joseph",
        "UserId": "AIDAYLC7MJPE5DK57AA2A",
        "Arn": "arn:aws:iam::573578169289:user/Joseph",
        "CreateDate": "2025-05-03T20:51:25+00:00"
    }
}
IAM user 'Joseph' created successfully.
Creating IAM user: Jonah ...
{
    "User": {
        "Path": "/",
        "UserName": "Jonah",
        "UserId": "AIDAYLC7MJPEQ2HOPL6G2",
        "Arn": "arn:aws:iam::573578169289:user/Jonah",
        "CreateDate": "2025-05-03T20:51:27+00:00"
    }
}
IAM user 'Jonah' created successfully.
Adding user 'David' to 'admin' group...
User 'David' added to group 'admin'.
Adding user 'Musa' to 'admin' group...
User 'Musa' added to group 'admin'.
Adding user 'Debbi' to 'admin' group...
User 'Debbi' added to group 'admin'.
Adding user 'Joseph' to 'admin' group...
User 'Joseph' added to group 'admin'.
Adding user 'Jonah' to 'admin' group...
User 'Jonah' added to group 'admin'.
```
![6. Terminal Result](./IMG/6.%20Terminal%20Result.png)
10. And here's the comfirmation on the web interface.
Admin Group Summary
![7. Admin Group](./IMG/7.%20Admin%20Group.png)
Admin Group Users
![8. Users in Admin](./IMG/8.%20Users%20in%20Admin.png)
Admin Group Permission
![9. Admin Permission](./IMG/9.%20Admin%20Permission.png)


[Link to my Bash script for IAM management](https://github.com/Orisuniyanu/3MTT/blob/main/Capstone%20Project%20Shell%20Scirpt%20for%20AWS/aws-iam-manager.sh)














































































