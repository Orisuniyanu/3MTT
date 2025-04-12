# Linux Command Deep Dive

## What is Linux Command?
A Linux command refers to a program or utility that runs in the command-line interface (CLI). The CLI is a text-based environment where you interact with the system by typing commands.

Linux command are executed by entering text in the Terminal and pressing `Enter`. These commands enable you to perform a wide range of tasks, including innstalling packages, managing users, manipulating files and directories, comfiguring system settings, and more.
```
CommandName [option(s)] [parameter(s)]
```
CommandName: This represents the action or task you want to perform using the command, e.g `ls` to list files in a folder.

Option or Flag: An option modifies the behavior of a command. it is typically preceded by a hyphen (-) or double hyphen (--). For example to show extra information for each listed file, we use `ls -l`.

Paremeter or Argument: A paremter provides specific information or data required by the command to execute the desired action. For example to create a new directory we use `mkdir` command the paremeter will the name we want to name the directory, e.g. `mkdir folder`.

## Manipulating files and directories on Linux
Most of the time I work with files and directories, so I take my time to learn how to navigate my way around different files and directories.

## Why Use sudo?
In Linux, some actions need special permission to be carried out, like creating files in certain areas like in `root directory`or changing important system settings like `systemctl`. "sudo" stands for "superuser do". and it allows me to run commands with the seccurity privileges fo another user, typically the superuser or root.

One of the reasons we used sudo is because of security, it helps in keeping the system secure by limiting access to powerful commands.

**How sudo Works:**

When I precede a command with sudo, Linux asks for my password. Once I enter it correctlly, I can run sudo commands as if were the system's superuser for a short period of time (usually 15 minutes). This means I don'r have to enter the password for each sudo command within the timeframe.

## Creating a Directory with sudo:
I need superuser privileges to create a directory in certain location on the system , location like the root directory "/". Here's how I do it:
1. I open my browser then login to AWS console account and start my Ubuntu server I have with them and also the check the new ip address assign to my VM (insstance)
![1. Instances Start](./IMG/1.%20Instances%20Start.png)
2. After the Ubuntu instance is in running state, I login my local environment to the cloud with the use of putty using ssh protocol.
![2. Putty](./IMG/2.%20Putty.png)
3. I try to create a file in the root directory without the use of `sudo`, the command is `mkdir /root/example` but the result is error ` Permission denied`. Then I use I ran the command again but this time is the help of `sudo` which is successful the full command is `sudo mkdir /root/example`, and i verify the result by running this command `sudo ls /root` to check if the example file I create is really present, and after the command I can find it there.
![3. Make Directory](./IMG/3.%20Make%20Directory.png)

## pwd command
`pwd` command is used to find the path of my current working directory. Just run `pwd` the full path to your current working directory will be display, e.g. `/home/iyanu`.

![4. pwd](./IMG/4.%20pwd.png)

## The Root Directory ("/")
AT the top of Linux filesystem hierachy is the root directory, denoted by a single slash `(/)`. Unlike Windows, which uses different drives (`**C**`, `**D**`, etc.), Linux organizes everything starting from the root directory which is the parent directory in all the directories present in the filesystem. Some other essential directories in Linux include:
1. **/bin**: Essential user commmand binaries that need to be available to all users are stored here (e.g., ls,cp).
2. **/etc**: Configuration files for the system can be found here.
3. **/home**: Personal directories for different users.
4. **/root**: The home directory for the root user.
5. **/var**: Variable data like logs.
6. **/usr**: Secondary hierachy for user data; contains majority of the user utilities and applications.

**cd** command

To navigate through the Linux files and directory, use the `cd` command.
1. First I navigate to the root directory ("/"), with this command `cd /`, then `pwd` to check my working present directory which is now my wokring directory, then I ran `ls -l` to list the the content inside the root directory which could include both files and directory, after that I ran `cd usr` to navigate inside the usr directory and I also list the content inside it also with `ls -l`.
![5. Changing Directory](./IMG/5.%20Changing%20of%20Directory.png)

## Side Hustle Task 1:
1. I create a directory called `photos` inside the `/usr` directory with this command `sudo mkdir photos`
2. I navigate into the `photos` directory with `cd photos`
3. I create 3 more random directories inside the `photos` directory which are `whatsapp`, `snapchat`, `camera` with `sudo mkdir camera whatsapp snapchat`
4. Then I display the 3 new directories I create with this command `ls -l`
5. I also navigate to one of the directories which is `camera` with `cd camera`
6. Finally I show to the full path to the directory I am in presently which is `camera`, with this command `pwd`.
![6. Making Directories](./IMG/6.%20Make%20Directory.png)

## cat command

`Concatenate`, or `cat`, is one of the common command in Linux. It lists, combines, and write file content to the standard output (i.e terminal console). To run `cat` command, type cat followed by the file name and it extension. for example:
```
cat /etc/os-release
```
And the result on the terminal will be like this:
![7. OS-RELEASE](./IMG/7.%20Os-release.png)

## cp command
`cp` command is used to copy files and directories from one place to another with their content. To use `cp` command is 
`cp` followed with the file or directory name then the desination. Here are some of the commands I ran with `cp` command.
1. I copy file1.txt in my /home directory and move it to Documents directory, `cp file1.txt Documents`.
2. I also copy the content to file1.txt to another new file which is file11.txt, `cp file1.txt file11.txt`.
3. I also copy entire Documents directory to another directory as a back up which I name "Documents_backup", `cp -R /home/iyanu/Documents /home/iyanu/Documents_backup`.
4. Lastly I view the content to the backup directory if is correctly copied and it was.
![8. Copy Files](./IMG/8.%20Copy%20files.png)

## mv command
The primary use of `mv` command is to move files or directories from different locations, and can also be use to rename a file or a directory. Some of the tasks I did with `mv` command:
1. I move a file from my home directory which is `file4.txt` to Documents directory, with `mv file4.txt Documents`.
2. I also use `mv` command to rename the file to another name, from `file4.txt` to `file44.txt`.
3. Lastly I view the content Documents directory if is correctly moved and it was.
![9. Move Files](./IMG/9.%20Move%20Files.png)

## rm command
The `rm` command is use to delete a file within a directory.
Below are some of the tasks I did with `rm` command:
1. I use `rm` to delete file5.txt from the home directory, with ` rm file5.txt`.
2. I also use `rm` to delete multiple files from the Documents_backup directory, with `rm file1.txt file2.txt file3.txt`.
3. Lastly I view the content to the backup directory if is correctly delete and it was.
![10. Remove files](./IMG/10.%20Remove%20Files.png)

## touch command
The `touch` command allow to create an empty file. e.g. `touch /home/iyanu/Documents/web.html`.

## find commmand
The `find` command is used to search for files within a specific directory and perform subsequent operations. 
e.g. `find /home -name file44.txt`.
![11. Touch and fide File](./IMG/11.%20Touch%20file.png)








