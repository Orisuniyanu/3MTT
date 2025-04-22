# 🚧 Mini Project – Error Handling in Shell Scripting
## 🧠 Overview
Error handling is a crucial part of scripting that allows you to anticipate, detect, and respond to issues that arise during script execution. These errors can come from invalid user input, missing resources, permission issues, or failed command executions. A well-written script should be able to handle such scenarios gracefully to improve reliability, robustness, and user experience.

## 🛠️ Implementing Error Handling
To effectively manage errors in shell scripting, follow these steps:

- Identify Potential Errors: Anticipate where things could go wrong: invalid inputs, missing files, network issues, permission problems, etc.

- Use Conditional Statements: Use if, elif, and else blocks to check the exit status of commands (using $? or directly).

### Display Informative Messages

Provide clear feedback when something fails so users understand what went wrong and how to fix it.

## ☁️ Handling S3 Bucket Existence Error
In AWS scripts, trying to create an S3 bucket that already exists results in an error. We can handle this by checking for the bucket's existence before attempting to create it.

### ❗ Problem:
Running the script multiple times without checks can create duplicate EC2 instances or fail to create an S3 bucket that already exists.

### ✅ Updated Function with Error Handling
- Bash
- Copy
- Edit

## Function to create S3 buckets for different departments
```bash
create_s3_buckets() {
    company="datawise"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")

    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-data-bucket"

        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Try to create the bucket
            aws s3api create-bucket --bucket "$bucket_name" --region your-region
            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
    done
}
```

## 📌 Notes
- `head-bucket` is used to check bucket existence.

- `2>/dev/null` suppresses unwanted output.

- Exit status `$?` helps determine if the last command was successful.

## 📝 Project Summary
In this mini project, I explored and implemented error handling in shell scripting with a focus on real-world scenarios like managing AWS resources. I learned how to anticipate possible failures, use conditional logic to validate command outcomes, and provide user-friendly error messages. By enhancing a function to create S3 buckets for various departments, I added a check to avoid re-creating existing buckets using the aws s3api head-bucket command. This helped me better understand exit statuses, conditional checks, and robust script design, improving the script’s efficiency and reliability.