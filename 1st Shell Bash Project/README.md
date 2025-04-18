# Shell Scripting

With the thousands of commands available to the command line user, how can we remember them all? The answer is, we don't. The real power of the computer is its ability to do the work for us. To get it to do that, we use the power of the shell to automate things. We write shell scripts.

---

## What is Shell Scripting?

Imagine you're tasked with setting up new workstations and user accounts regularly at your job. Instead of manually creating each folder and user account, a simple shell script serves as your efficient digital helper. By automating the creation of multiple directories and user accounts with just a few lines of code, it saves you considerable time and effort, allowing you to concentrate on more critical aspects of your work.

Shell scripting is the process of writing and executing a series of instructions in a shell to automate tasks. A shell script is essentially a script or program written in a shell language, such as Bash, sh, zsh, or PowerShell.

---

## Sample Shell Script

```bash
#!/bin/bash

# Create directories
mkdir Folder1
mkdir Folder2
mkdir Folder3

# Create users
sudo useradd user1
sudo useradd user2
sudo useradd user3
```

---

## Task Instructions

### Step 1: Create the Project Folder
I open my Ubuntu that I create on Oracle virtual Box and start my Ubuntu server.
Then I create a new directory called `shell-scripting` and move to the directory.

```bash
mkdir shell-scripting
cd shell-scripting
```
![1. Create Directory](./IMG/1.%20Create%20Directory.png)

### Step 2: Create the Script File Using Vim
Then I create a new file called `my_first_shell_script.sh` then I input those bash tasks to it then save it with `wq!`.

```bash
vim my_first_shell_script.sh
```
![2. VIM](./IMG/2.%20VIM.png)

### Step 3: Verify the File
Then I ran `ls -l` to verify if the file is create and it's, then I try to run the script without giving it executable permit which result to error as expected.

```bash
ls -l
./my_first_shell_script.sh
```
![3. Run Script](./IMG/3.%20Ran%20Script.png)

---

## File Permissions

The permission string:
```
-rw-r--r--
```
Means:
1. The owner has read (r) and write (w) permissions.
2. Group has read (r) permission.
3. Others have read (r) permission.

No one has execute (x) permission, so the script cannot be executed directly.

### Trying to Execute
```bash
./my_first_shell_script.sh
```
You will see:
```
bash: ./my_first_shell_script.sh: Permission denied
```

---

### Step 4: Grant Execute Permission
Then I give the owner the executable permit `"x"` then the file color change to "green" color.

```bash
chmod u+x my_first_shell_script.sh
```
Then run the script again which ask me for my password because some of the task in the script require superuser privilage `**useradd**`:
```bash
./my_first_shell_script.sh
```
And it was successful.
![4. Rerun The Script](./IMG/4.%20Rerun%20the%20Script.png)
---

### Step 5: Confirm Task Success
After the script finished it tasks I check it to comfirm them:

#### Directories:
```bash
ls -lart
```
Check that Folder1, Folder2, and Folder3 are present.

#### Users:
```bash
getent passwd | tail -5
id user1
id user2
id user3
```
Chech that user1, user2 and user3 are present, which they are.
![5. Confirm Script](./IMG/5.%20Confirm%20Script.png)
---

## Shebang: `#!/bin/bash`

The line at the top of the script:
```bash
#!/bin/bash
```
Is called a **shebang**. It tells the system to use the Bash shell to interpret the script. Other shells can be specified by changing the path.

Examples:
- `#!/bin/sh`
- `#!/usr/bin/env bash`
**/bin/bash:** This is the absolute path to the Bash shell executable. It tells the system to use the Bash interpreter located at /bin/bash to run the script.

Without the shebang line, the system may not know how to interpret and execute the script, and I have to specify the interpreter when running the script.
---

## Variables in Shell Scripting


In programming generally, not just scripting, **variables** are essentail for creaging dynamic and flexible programs.
variables can store data of various types such as numbers, strings, and arrays. You I can assign values to the variables using the **=** operatir, and access their values using the vatiable name preceded by a $sign.

### Declaration:
Example: Assigning value to a variable:
```bash
name="John"
```

### Usage:
After assigning a value to a variable, as I did above, I can then utilize the variable in various ways in the script or program. One of the most starightforward methods t use or retrieve the value stored in a variable is by echoing the assign back to the terminal. This is done with **echo** command in the shell scripting.
```bash
echo $name
```
Output:
```bash
John
```

### Interpolation:
```bash
echo "My name is $name"
```
Output:
```bash
My name is John
```
![6. Variable](./IMG/6.%20Variable.png)

---



