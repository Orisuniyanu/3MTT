# Understanding Environment Variables & Infrastructure Environment: Key Differences

## Introduction
As we delve deeper into the world of technology and its building blocks, two essential concepts often come to forefront: "Infrastructure Environments" and "Environment Variables". Despite both terms fewturing "Environment", they play distinct roles in the realm of scripting and software development. This common terminology can lead to confusion, making it crucial to distinguish and understand each concept from the outset.

## Infrastructure Environments
Infrastructure environment refer to the various settings where software applications are developed, tested, and deployed, each serving a unique purpose in the software liftcycle.

Lets say you are working with a development team to build a FinTech product. They have 2 different AWS accounts. The journey would be something like;

1. **VirtualBox + Ubuntu:** The development environment where all local development is done on your laptop.
2. **AWS Account 1:** The testing environment where, after local development is completed, the code is pushed to an EC2 instance in **AWS Account 2**, where the customers consume the Fintech product through a website.
3. **AWS Account 2:** The production environment, where after tests are completed in **AWS Account1:**, the code is pushed to an EC2 instance in **AWS Account 2**, where the customers consume the Fintech product through a website.

Each setup is considered as an **Infrastructure Environment.**

On the other hand, environment variables are key-value pairs used in scripts or computer code to manage configuration values and control software behavior dynamically.

## Environment Variables

imagine your FinTech product needs to connect to a databash to fetch financial data. However, the details of this databash connection, like the databash **URL, username,** and **password** differ between your **development, testing,** and **production** environments.

If you need tio develop a shell script that will be resused across all the 3 different environments, then it is important to dynamically fetch the correct value for your connectivity to those environments.

Here's how environment variables come into play:

## Development Environment (VirtualBox + Ubuntu)

## Environment Variables:

- DB_URL=localhost
- DB_USER=test_user
- DB_PASS=test_pass

Here's the environment variables point to a local database on local laptop where I can safely experiment without affecting real or test data.

## Testing Environment (AWS Account 1):

## Environment Variables:

- DB_URL=testing-db.example.com
- DB_USER=testing_user
- DB_PASS=testing_pass

In this environment, the variables are configured to connect to a remote database dedicated to testing. This ensures that tests are performed in a coctrolled environment that simulates production settings without risking actual customer data.

## Production Environment (AWS Account2):

## Environment Variables:

- DB_URL=prodction-db.example.com
- DB_USER=testing_user
- DB_PASS=testing_pass

Finally, when the application is running in the production environment, the environment variables switch to ensure the application connects to the live database. This is where real customer interactions happen, and the data needs to be accurate and secure.

By clarifying these differences early on, we set a solid foundation for navigating complexities of technology development with greater ease and precision.

Now lets begin development shell script to manage cloud infrastructure.

**aws_cloud_manager.sh script**

**aws_cloud_manager.sh script** this will be where environment variables will be defined, and command line arguments are added to control if the script should run for local environment, testing or production environment.

Developing a shell script is usually done by starting with incremental changes.

- Since I am using windows, I will login to my Ubuntu desktops in virtual box and open the terminal. Then I will create that script
- Then put the code below into the file

```bash
#!/bin/bash

# Checking and acting on the environment variable
if [ "$ENVIRONMENT" == "local" ]; then
echo "Running script for Local Environment..."
# Commands for local environment
elif [ "$ENVIRONMENT" == "testing" ]; then
echo "Running script for Testing Environment..."
# Commands for testing environment
elif [ "$ENVIRONMENT" == "production" ]; then
echo "Running script for Production Environment..."
# Commands for production environment
else
echo "No environment specified or recognized."
exit 2
fi
```
- After that I will give it the relevant permission to execute on the local terminal
```bash
chmod +x aws_cloud_manager.sh
```
- If I execute this code it is, the execution should go into the else block just because there is no **$EVIRONMENT** variables set.

```bash
export ENVIRONMENT=production
```
- Then run the script again. The output should be like this;

```bash
Running script for Production Environment...
```
![1. Putty](./IMG/1.%20Putty.png)

Now, you can see how environment variables can be used dynamically apply logic in the script based on the requirement you are trying to satisfy. 

The **export** command is used to set key and valuse for environment variables.

- We can also set the variable directly within the script. For example if the script was like this.
```bash
#!/bin/bash

# Initialize environment variable
ENVIRONMENT="testing"

# Checking and acting on the environment variable
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
  # Commands for local environment
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
  # Commands for testing environment
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
  # Commands for production environment
else
  echo "No environment specified or recognized."
  exit 2
fi
```
![2. Edit](./IMG/2.%20Edit.png)

Running this version of script would mean everytime I run it, it will consider the logic for testing environment. Because the value has been "hard coded" in the script, and that is longer dynamic.

The best way to do this would be to use command line arguments.

## Postional Paremeters in Shell Scripting
As I have mentioned before, hard-coding values directly into script is considered poor practice. Instead, we aim for flexibility parameters come in a capability in shell scripting that enables passing arguments to script at runtime, and then replaces the argument with the parameter inside the script.

- The argument passed to the script is the value that is provided at runtime.

As in the case below where the argument is "testing", and it is also the value to the variable within the script.

```bash
./aws_cloud_manager.sh testing
```
![3. Test](./IMG/3.%20Test.png)
- Inside the script I will have this;
```bash
ENVIRONMENT=$1
```
`**$1**`: Is the postional parameter which will be replaced by the argument passed to the script.

Because it is possible to pass multiple parameters to a script, dollar sign `**$1**` is used to prefix the position of the argument passed to the script. imagine if another variable within the script is called **NUMBER_OF_INSTANCES** that determines how many EC2 instance get provisioned, then calling the script might look likw;
```bash
./aws_cloud_manager.sh testing 5
```
![4. Test 5](./IMG/4.%20Test%205.png)

The positional parameters inside the script would then look like this

```bash
ENVIRONMENT=$1
NUMBER_OF_INSTANCES=$2
```

- Each positional parameter within the script corresponds to a specific argument passed to the script, and each parameter has a position represented by an index number.

## Condition to check the number of arguments

Creating shell script to meet specific requirement is one aspect of development, but ensuring their cleanliness and freedom from bugs is equally crucial. Integrating logical checks periodically to validate date is considered a best practice in script development.

A prime example of this is verifying the number of argument passed to the script, ensuring that thw script receives the correct input required for its execution, and providing clear guildance to users in case of incorrect usage.

Below code ensure that the script is executed, exactly 1 argument is passed to it, otherwise it fails with an exit code of 1 and an shows a message telling the user how to use the script.

```bash
# Checking the number of arguments
if [ "$#" -ne 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi
```

- **"$#"** - This is the special variable that holds the number of argument passed to the script.
- **"-ne"** - Means "Not equal"
- **"$0"** - Represent the positional parameter of 0, which is the script itself.

Hence, if number if arguments is not equal to "1". then show the echo message.

Here's the updated script look like;

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
![5. Final Result](./IMG/5.%20Final%20Result.png)

