# 5 Essential Skills to Elevate I Shell Scripting Journey into Cloud Computing

## Introduction

This mini project aims to strengthen my shell scripting skills by applying them in a real-world cloud computing scenario. The task is to write a shell script that automates the deployment of AWS resources (EC2 instances and S3 buckets) for a fictional client of DataWise Solutions.

The script must demonstrate the use of 5 essential scripting concepts:

- **Functions –** To modularize tasks like creating EC2 and S3.

- **Arrays –** To track created resources.

- **Environment Variables –** To securely manage configurations like AWS region and credentials.

- **Command Line Arguments –** To allow dynamic input like instance type and bucket name.

- **Error Handling –** To detect and respond to failures gracefully.

The overall goal is to create a flexible, reusable, and reliable automation script that reflects best practices in both scripting and cloud deployment.


## Delivering the Shell Script Based on a Real World Requirement.

**Background:**

DataWise Solutions is a forward-thinking Data Science Consulting Company that specializes in deploying analytical and machine learning environments to support data-driven decision-making for its clients. Recognizing the need for agility and efficiency in setting up such environments, DataWise has decided to streamline its deployment process on AWS, focusing on simplicity and automation.

**Scenario:**

One of DataWise Solutions' clients, a burgeoning e-commerce startup, is looking to harness the power of data science to analyze customer behavior and enhance their shopping experience. The startup wishes to deploy their data science workspace on AWS, utilizing EC2 instances for computational tasks and S3 buckets for storing their vast datasets of customer interactions.

## Specific Requirements:

To meet the client's needs and ensure a practical learning experience, DataWise Solutions plans to develop a script that automates the setup of EC2 instances and S3 buckets. This script will incorporate the 5 critical shell scripting concepts previously identified:

1. **Functions:** Implement custom functions to modularize tasks like creating EC2 instances, configuring S3 buckets, and verifying deployment statuses.

2. **Arrays:** Use arrays to manage a list of resources created, ensuring easy tracking and manipulation.

3. **Environment Variables:** Leverage environment variables to store sensitive information like AWS credentials, region settings, and configuration parameters, enhancing script portability and security.

4. **Command Line Arguments:** Accept command
line arguments to customize the script's behavior, such as specifying the EC2 instance type or S3 bucket name, allowing for dynamic and flexible deployments.

5. **Error Handling:** Implement robust error
handling mechanisms to catch and respond to AWS service exceptions, ensuring the script can recover gracefully from failures.


## ✅ Project Summary:
**This script:**

- Accepts command line arguments to specify EC2 instance type, S3 bucket name, and region.

- Uses functions to modularize the logic.

- Uses arrays to track created resources.

- Uses environment variables to store sensitive or default values.

- Handles errors at key steps gracefully.

## ⚠️ Prerequisites:
- AWS CLI must be configured (aws configure) with proper IAM permissions.

- Script should be run in a Linux/WSL/Cloud Shell environment.

## Sample of the Shell Script 

1. This script must have a name which we can call it `deploy_ds_env.sh`.
2. We can use any text editor of our choice like **Vim**, **Nano**, even **Vscode**.

3. Here's my script 
```bash
#!/bin/bash

# --- Environment Variables ---
export AWS_REGION=${AWS_REGION:-"us-east-1"}
export AWS_PROFILE=${AWS_PROFILE:-"default"}

# --- Arrays to Track Resources ---
declare -a CREATED_RESOURCES

# --- Error Handling Function ---
handle_error() {
    echo "❌ Error: $1"
    exit 1
}

# --- Function to Create S3 Bucket ---
create_s3_bucket() {
    local BUCKET_NAME=$1
    echo "🔧 Creating S3 bucket: $BUCKET_NAME"

    aws s3api create-bucket \
        --bucket "$BUCKET_NAME" \
        --region "$AWS_REGION" \
        --create-bucket-configuration LocationConstraint="$AWS_REGION" \
        --profile "$AWS_PROFILE" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "✅ S3 bucket '$BUCKET_NAME' created successfully."
        CREATED_RESOURCES+=("S3:$BUCKET_NAME")
    else
        handle_error "Failed to create S3 bucket: $BUCKET_NAME"
    fi
}

# --- Function to Launch EC2 Instance ---
create_ec2_instance() {
    local INSTANCE_TYPE=$1
    echo "🚀 Launching EC2 instance of type: $INSTANCE_TYPE"

    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0c02fb55956c7d316 \  # Amazon Linux 2 AMI (you can change it)
        --instance-type "$INSTANCE_TYPE" \
        --key-name MyKeyPair \  # Replace with your actual key pair
        --security-groups default \
        --region "$AWS_REGION" \
        --profile "$AWS_PROFILE" \
        --query "Instances[0].InstanceId" \
        --output text 2>/dev/null)

    if [ $? -eq 0 ]; then
        echo "✅ EC2 instance launched successfully: ID = $INSTANCE_ID"
        CREATED_RESOURCES+=("EC2:$INSTANCE_ID")
    else
        handle_error "Failed to launch EC2 instance of type: $INSTANCE_TYPE"
    fi
}

# --- Function to Show Summary ---
show_summary() {
    echo -e "\n📋 Resources Created:"
    for resource in "${CREATED_RESOURCES[@]}"; do
        echo "- $resource"
    done
}

# --- Main Script Logic with Arguments ---
if [ $# -ne 2 ]; then
    echo "Usage: $0 <ec2_instance_type> <s3_bucket_name>"
    exit 1
fi

INSTANCE_TYPE=$1
BUCKET_NAME=$2

echo "🌍 Using AWS Region: $AWS_REGION"
echo "👤 Using AWS Profile: $AWS_PROFILE"

# --- Execute Tasks ---
create_s3_bucket "$BUCKET_NAME"
create_ec2_instance "$INSTANCE_TYPE"
show_summary
```

4. How to Run It
```bash
chmod +x deploy_ds_env.sh
./deploy_ds_env.sh
```

5. How the 5 Skills Are Used
- **Functions:** Separate logic for creating EC2, S3, error handling, and summary
- **Arrays:** CREATED_RESOURCES array stores names/IDs of resources created
- **Environment Variables:** AWS_REGION and AWS_PROFILE set globally for reuse and security
- **Command Line Arguments:** $1 and $2 used to accept EC2 type and S3 bucket name
- **Error Handling:** Handle_error function catches errors and exits gracefully with a message


