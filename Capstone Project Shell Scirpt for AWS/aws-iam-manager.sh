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
