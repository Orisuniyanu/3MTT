# Creating AWS Resource with Functions & Introducing Arrays

## Introduction
As the demand for scalable and automated infrastructure continues to rise, the ability to deploy cloud resources efficiently has become a vital skill for anyone entering the fields of DevOps, Cloud Engineering, or System Administration. In this project, we explore how to automate the creation of AWS resources—specifically EC2 instances and S3 buckets—using shell scripting.

The focus is on leveraging functions to modularize tasks and make the script cleaner, reusable, and easier to maintain. Functions allow us to isolate specific actions, such as creating an EC2 instance or checking deployment status, which improves clarity and reliability in larger automation workflows.

Alongside functions, we also introduce the use of arrays, which help in tracking and managing multiple resources. Arrays enable the script to efficiently store and reference the names or IDs of resources created during the execution, making it easier to report results, handle cleanup, or perform further operations.

By combining these scripting techniques, this project lays the foundation for building smarter, more structured automation tools—an essential step toward mastering cloud-based infrastructure management.


## Steps

I'll begin with project by creating two functions:

1. One for provisioning EC2 instances and
2. Another for setting up S3 buckets.

These functions will streamline the process of resource creation and enable us to automate tasks effectively.

## Function to Provision EC2 instances

1. To programmatically create EC2 instance, I use [official documentation](https://docs.aws.amazon.com/cli/latest/reference/ec2/) to understand how to use [`aws cli` to create instances.](https://docs.aws.amazon.com/cli/latest/reference/ec2/)
![1. EC2 CLI](./IMG/1.%20EC2%20CLI.png)

2. I search for **run-instances** on the same page with **Control F** then it took me to the details documentation on the sub-command to create EC2 instances.
![2. Run Instance](./IMG/2.%20Run%20Instance.png)

3. Example : To launch an instance into a non-default subnet and add a public IP address:

The following run-instances example requests a public IP address for an instance that you’re launching into a nondefault subnet. The instance is associated with the specified security group.
```bash
aws ec2 run-instances \
    --image-id "ami-0cd59ecaf368e5ccf" \
    --instance-type "t2.micro" \
    --count 5 \
    --key-name aws_key \
    --region eu-west-2
```
4. For this command to work I must have this `aws_key` already existing on my account.
- I login to my AWS account.
- Search for EC2, then at the left side I look for `Key Pairs`.
- Then I create a new key pair which I name **aws_key**.
![3. Key Pair](./IMG/3.%20Key%20Pair.png)
5. After I create the key pair I update my script as follows,
```bash
#!/bin/bash

# Function to create EC2 instances
create_ec2_instances() {
    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="ami-0cd59ecaf368e5ccf"  
    count=2  # Number of instances to create
    region="eu-west-2" # Region to create cloud resources

    # Create the EC2 instances
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count \
        --key-name aws_key \
        --region "$region"

    # Check if the EC2 instances were created successfully
    if [ $? -eq 0 ]; then
        echo "EC2 instances created successfully."
    else
        echo "Failed to create EC2 instances."
    fi
}

# Call the function to create EC2 instances
create_ec2_instances
```

Highlight of some of new areas

- **$?::** This is special variables that holds the exit status of the last executed command. In this case, it checks if the aws EC2 run-instances command was successful. exit status that equals 0 is interpreted as successful. Therefore if exit code is "0", then echo the message to confirm that the previous command was successful.

- I used environment variables to hold the value of **ami_id, count and region** and replaced with their respective values with **ami_id, count and $region**.

## Function to create S3 buckets and Learn about Arrays

Before diving into creating S3 buckets, I watched this [video](https://www.youtube.com/watch?v=e6w9LwZJFIA&pp=ygURd2hhdCBpcyBzMyBidWNrZXQ%3D), to brush up on AWS S3 bucket concepts.

The [AWS CLI reference for S3 can be found here.](https://docs.aws.amazon.com/cli/latest/reference/s3api/), which is used in this script.

In this section, my objective is to create five distinct S3 buckets, each designed for storing related to Marketing, Sales, HR, Operations, and Media.

To achieve this, I'll utilize a fundamental data structure in shell scripting known as "array". this is because, I need one single variable holding all the data, and then the capability to loop through them.

**Arrays in shell scripting**

An array is a versatile data structure that allows you to store multiple values under a single variable name. particularly in shell scripting, arrays offer an efficient means of managing collections of related data, making them invaluable for our tesk ahead.

Below is what the function would look like.

```bash
# Function to create S3 buckets for different departments
create_s3_buckets() {
    # Define a company name as prefix
    company="datawise"
    
    # Array of department names
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    
    # Loop through the array and create S3 buckets for each department
    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-Data-Bucket"
        
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket "$bucket_name" --region your-region
        
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
}

# Call the function to create S3 buckets for different departments
create_s3_buckets
```

Here's the breakdown of each part of the code.

This line begins the definition of a shell function named **create_s3_buckets.**

```bash
# Function to create S3 buckets for different departments
create_s3_buckets() {"\n    ```\n- Here, we define a variable named company and assign it the value \"datawise\". This variable will serve as the prefix for all S3 bucket names, ensuring their uniqueness. You should replace **datawise** with any other company name of your choice or any other unique identifier. This is because S3 buckets **MUST** be unique globally.\n  \n    ```\n    # Define a company name as prefix\n    company=\"datawise\"\n\n    ```\n\n- This is where we define a variable that is an array. An array named **departments** is declared, containing the names of different departments. Each department name will be used to construct the name of an S3 bucket.\n  ```\n    # Array of department names\n    departments=(\"Marketing\" \"Sales\" \"HR\" \"Operations\" \"Media\")\n  ```\n\n- This line initiates a loop that iterates over each element in the departments array. For each iteration, the value of the current department name is stored in the variable **department**.\n\n    ```\n    for department in \"${departments[@]"}"; do
```

```bash
    The syntax ${departments[@]} in Bash refers to all elements in the array departments.

    [@]: This is an index or slice syntax specific to arrays in Bash. It signifies that we want to access all elements of the array.

    If you were interested in accessing a single element from the array, you would still use the syntax $departments[index]}, where index is the position of the element you want to access. Remember that array indexing in Bash starts from 0.
```
An example is;

```bash
departments=("Marketing" "Sales" "HR" "Operations" "Media")

# Accessing the fourth element (Operations) from the array
echo "${departments[3]}"
```

Output:

```bash
Operations
```

- Withing the loop, I construct the name of the S3 bucket using the **company prefix**, the current **department** name, and the suffix "-Data-Bucket". This ensures that each bucket name is unique.

```bash
bucket_name="${company}-${department}-Data-Bucket"
```

Using the AWS CLI (aws s3api), we create an S3 bucket with the specified name from the variable ($bucket_name), in the specified AWS region (us-west-2).

```bash
    # Create S3 bucket using AWS CLI
    aws s3api create-bucket --bucket "$bucket_name" --region us-west-2
```

- This line checks the exit status of the previous command (aws s3api create-bucket). A value of 0 indicates success, while non-zero values indicate failure.

```bash
    if [ $? -eq 0 ]; then
```

` Based on the exit status of the aws s3api command, I print a corresponding message indicating whether the bucket was successful or not.

```bash
        echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
```
- This line marks the end of the **create_s3_buckets** function definition.

```bash
}
```

**The complete script for both EC2 and S3:**

```
#!/bin/bash

# Environment variables
ENVIRONMENT=$1

# Function to check number of arguments
check_num_of_args() {
    # Checking the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Function to activate infrastructure environment
activate_infra_environment() {
    # Acting based on the argument value
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

# Function to create EC2 Instances
create_ec2_instances() {
    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="ami-0cd59ecaf368e5ccf"
    count=2  # Number of instances to create
    region="eu-west-2"  # Region to create cloud resources

    # Create the EC2 instances
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count \
        --key-name MyKeyPair \
        --region "$region"

    # Check if the EC2 instances were created successfully
    if [ $? -eq 0 ]; then
        echo "EC2 instances created successfully."
    else
        echo "Failed to create EC2 instances."
    fi
}

# Function to create S3 buckets for different departments
create_s3_buckets() {
    # Define a company name as prefix
    company="datawise"

    # Array of department names
    departments=("Marketing" "Sales" "HR" "Operations" "Media")

    # Loop through the array and create S3 buckets for each department
    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-Data-Bucket"
        
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket "$bucket_name" --region your-region
        
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
}

# Execution flow
check_num_of_args "$@"
activate_infra_environment
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets
```