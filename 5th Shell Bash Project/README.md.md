
# 🛠️ Mini Project – Working with Functions in Shell Scripting

## 📌 Project Goal

You’re developing a shell script for one of **DataWise Solutions’** clients. The script automates the setup of **EC2 instances** and **S3 buckets**, and you'll be focusing on **using functions** to organize and streamline your code.

---

## 🧩 Why Use Functions?

Functions help you:

- **Organize code logically**
- Improve **readability and maintenance**
- Allow **reusability** of logic

Each requirement should be encapsulated into a function. Here are the tasks you will cover with functions:

---

## ✅ Functional Requirements

1. Check if the script has an argument
2. Check if AWS CLI is installed
3. Check if AWS authentication environment variable is set

---

## 📘 Function Syntax in Shell

```bash
function_name() {
  # function body
  # logic and commands here
}
```

---

## 🔍 1. Function to Check if Script Has an Argument

### 🔓 Without a Function
```bash
#!/bin/bash

# Checking the number of arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <environment>"
  exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

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
```

### 🔐 With a Function
```bash
#!/bin/bash

# Environment variable
ENVIRONMENT=$1

# Function to check arguments
check_num_of_args() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
  fi
}

# Function to handle environment logic
activate_infra_environment() {
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

# Calling functions
check_num_of_args "$@"
activate_infra_environment
```

---

## 🔍 2. Function to Check if AWS CLI is Installed

```bash
# Function to check if AWS CLI is installed
check_aws_cli() {
  if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it before proceeding."
    return 1
  fi
}
```

### 🧠 Explanation

- `command -v aws`: checks if `aws` command is available.
- `!` negates the result, meaning “if aws is **not** found…”
- `&> /dev/null`: suppresses output (both stdout and stderr).
- `return 1`: indicates an error.

You can also test this on your machine using:

```bash
which aws
```

---

## 🔍 3. Function to Check If AWS Profile Is Set

```bash
# Function to check if AWS profile environment variable is set
check_aws_profile() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "AWS profile environment variable is not set."
    return 1
  fi
}
```

### 🧠 Explanation

- `-z "$AWS_PROFILE"` checks if the variable is empty.
- If true, it prints an error and returns 1.

---

## 📁 AWS Credentials Overview

Run `aws configure` to set these up.

### `~/.aws/credentials`

```ini
[default]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY

[profile testing]
aws_access_key_id = YOUR_TESTING_ACCESS_KEY
aws_secret_access_key = YOUR_TESTING_SECRET_KEY

[profile production]
aws_access_key_id = YOUR_PROD_ACCESS_KEY
aws_secret_access_key = YOUR_PROD_SECRET_KEY
```

### `~/.aws/config`

```ini
[default]
region = us-east-1
output = json

[profile testing]
region = us-west-2
output = json

[profile production]
region = us-west-2
output = json
```

Set the AWS profile using:

```bash
export AWS_PROFILE=testing
```

---

## 🔚 Final Shell Script with All Functions

```bash
#!/bin/bash

# Environment variable
ENVIRONMENT=$1

# Function to check number of arguments
check_num_of_args() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
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

# Function to activate environment-specific logic
activate_infra_environment() {
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

# Call functions
check_num_of_args "$@"
check_aws_cli
check_aws_profile
activate_infra_environment
```

---

## 🎉 Summary

These are I learned:

✅ Organize shell scripts using functions  
✅ Validate input arguments  
✅ Check for CLI tools and environment variables  
✅ Apply logic based on dynamic input  

This modular approach will help me in real-world automation projects where clean, reusable, and testable code is key.
