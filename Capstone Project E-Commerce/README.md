# Capstone Project: E-Commerce Platform Deployment with Git, Linux, and AWS

## Overview
On this project I was assigned to develop an e-commerce website for a new online marketplace name `**MarketPeak**`. This platform will feature product listings, a shopping cart, and user authentication. My objective is to utilize Git for version control, develop the platform in a Linux environment (Ubuntu Server), and deploy it on a AWS EC2 instance. I got the website template I used to kickstart the development in this website [Tooplate Website](https://www.tooplate.com/).

## TASKS
### A. Implement Version Control with Git
1. Initialize Git Repository
- I begin with start my Ubuntu Server on the Oracle Virtual Box then I connect to the server from the `putty` application.
- Then begin with creating a project directory which I named `**"MarketPeak_Ecommerce"**`in my home directory.
- Inside the directory, initialize a Git repository to manage my version control.
```bash
mkdir MarketPeak_Ecommerce
cd MarketPeak_Ecommerce
git init
```
![1. Directory](./IMG/1.%20Directory.png)

2. Obtain and Prepare the E-Commerce Website Templete

Instead of me developing the website from the scratch, I use a pre-existing e-commerce website templete. This approach allows me to focus on the deployment and operational aspects, rather than on web development.
- I visit [Tooplate Website](https://www.tooplate.com/) then search for me templete I will use. 
- Then I decide to use this templete, [Templete](https://www.tooplate.com/view/2127-little-fashion), then I click on the `download` to save the templete on my local folder.
![2. Download Templete](./IMG/2.%20Download%20Templete.png)
- Then I extract the the Website Templete from my Download directory, move it to the `MarketPeak_Ecommerce` directory then renamed to `little-fashion`.
```bash
cd ~/Downloads
ls -lart 
unzip 2127_little_fashion.zip -d little-fashion
cd .. && cd MarketPeak_Ecommerce
cp -r ~/Downloads/little-fashion/* .
ls
```
![3. Extract](./IMG/3.%20Archieve.png)
![4. Copy Templete](./IMG/4.%20Copy%20the%20Templete.png)
- I after that I try to **Customize Branding**
I open `index.html` then change the title from `Little Fashion` to `MarketPeak`
from and also adjust the logo which is written with text to `MarketPeak`
```Html
<title>Little Fashion</title>
```
To
```Html
<title>MarketPeak</title>
```
![5. Change Title](./IMG/5.%20Index%20File%20Change.png)

3. Stage and Commit the Template to Git
- Firstly I make sure to be inside the `MarketPeak_Ecommerce` directory with `pwd` command.
- Then I make to to add all the files to git to track them because their are still under untracked which means git doesn't know about those files.
```bash 
git status
git add .
```
![6. Git Add](./IMG/6.%20Git%20Add.png)

- I have already set my configuration in the previous project where I set my **name** and **email**, but because of this project I will run the command again.
```bash
git config --global user.name "Iyanu Emmanuel"
git config --global user.email "iyanuemmanuel3@gmail.com"
```
- Then I commit all the changes with clear, descriptive message `Initial commit: Set up E-commerce structure and change Little Fashion to MarketPeak Templete`.
```bash
git commit -m "Initial commit: Set up E-commerce structure and change Little Fashion to MarketPeak Templete"
```
![7. Git Commit](./IMG/7.%20Git%20Commit.png)

4. Push the Code to My GitHub Repository
After I initialize my Git repository and adding my e-commerce website template, the next is that I push the code to a remote repository om GitHub.
- I log into my GitHub Account `orisuniyanu` and create a new repository which I named `**MarketPeak_Ecommerce**`, by clicking on my `image` at the top right side then click on `Repository` then click on `New` to create a new repository, I leave the repository without initializing it with README, .gitignore, or license file.
![8. GitHub](./IMG/8.%20GitHub.png)
![9. New Repository](./IMG/9.%20New%20Repo.png)
- Then I link my Local Repository to GitHub in the terminal (GitBash) within my project directory, and add remote repository URL to the local repository configuration.
```bash
git remote add origin https://github.com/Orisuniyanu/MarketPeak_Ecommerce.git
```
- After that I push my code to upload and update my local repository content to GitHub.
```bash
git push -u origin main
```
This command pushes my commits from local main branch to the remote repository on GitHub, enabling me to store my project in the cloud and share it with others.
- When I try to push I am getting error and I noticed that GitHub as diable pushing the `http`, so since I have already set my **SSH** before I just change the remote URL from **http** to **SSH**.
```bash
git remote set-url origin git@github.com:Orisuniyanu/MarketPeak_Ecommerce.git
git push -u origin main
```
After this, I was able to push to my remote repository (GitHub) successfully.
![10. Push to GitHub](./IMG/10.%20Push%20to%20GitHub.png)
Here is the result on the GitHub Account.
![11. GitHub Result](./IMG/11.%20Successfully%20Pushed.png)

### 2. AWS Deployment

To deploy **"MarketPeak_Ecommerce'** platform, I start by setting up an Amazon EC2 instance:
### 2.1. Set Up and Start AWS EC2 Instance
- I open my `google chrome browser` then navigate in to the [AWS MANAGEMENT Console](https://aws.amazon.com/console/), then click on `Sign in to the console`.
![12. AWS ](./IMG/12.%20AWS%20Management%20Console.png)
- After that I Sign in with `IAM user`
![12. IAM Signin](./IMG/13.%20IAM%20Signin.png), after that I input all my information like my `username` and `password`, then I click on `sign in` and I was signed in successfully.
![13. Signin](./IMG/13.%20IAM%20Signin.png).
- Then I start my Ubuntu Server on the AWS Platform. Then also copy the public IP Address so that I can connect to the Ubuntu server with my `putty` application.
![15. Ubuntu Running](./IMG/15.%20Ubuntu%20Running.png)
![16. Putty Connected](./IMG/16.%20Putty%20Connected.png)


### 2.2. Connect the Instance using SSH
Before deploying my E-Commerce Platform, I need to clone my GitHub repository to my AWS EC2 instance. This process involves authenticating with GitHub and choosing between two primary methods of cloning a repository: **SSH** and **HTTPS.** For the sake of this project I will be going for the **SSH** Connection.
- I open my `GitBash Terminal`, to generate the ssh key that I will use to authticate the connection between the local and the remote repository (GitHub).
- Then I ran the following commands.
```bash
ssh-keygen -t rsa -b 4096 -C "GitHub Connection"
cat id_rsa.pub
```
This will generate private and public key inside the `.ssh` directory.
![17. SSH Key](./IMG/17.%20SSH%20Key.png)
**Explain the code above**
ssh-keygen -- the tool I used to generate SSH key pairs.
-t rsa -- I want to specifies the type of key to create, RSA is a widely used encryption alogrithm.
-b 4096 -- The number of bits I want in the key, **2048** is the default but I want to make it more stronger so I decided to go with **4096**.
-C -- This is just to add comment, so that it will be easy for me to identify anytime.

- After I cat the public key I copy it then move to my GitHub to initialize the connection.
- On my GitHub account, I click on the `small picture` at the top left side which is my profile, then click on `settings`, then click on `SSH and GPG keys`.
![18. SSH and GPG keys](./IMG/18.%20SSH%20and%20GPG%20keys.png)
- Then it display all the existing connection I have before, then I click on `New SSH key`, then give it a description and I paste the public key I copied from the Ubuntu server and paste it `Key` colomn then finally I click on `Add SSH key`, and it was successful.
![19. SSH Ubuntu](./IMG/19.%20SSH%20Ubuntu.png)
- Then I navigate back to my **Ubuntu Server** to test the connection if it will be successful.
![20. Test Connection](./IMG/20.%20Test%20Connection.png)
- After that I clone my remote repository down to my local repository.
```bash
 git clone git@github.com:Orisuniyanu/MarketPeak_Ecommerce.git
```
![21. Clone](./IMG/21.%20Clone.png)
then check if it's successful and it was.
![22. Check Clone](./IMG/22.%20Check%20Clone.png)

### 2.3. Install a Web Server on EC2
**Apache HTTP Server (httpd):** is a widely used web server that servers HTML files and content over the internet. Installing it on Linux EC2 server allows me to host **MarketPeak E-commerce** site:
- I install Apache web server on the EC2 instance. **httpd** is the software name for **Apache** on the system using package manager.
```bash
sudo yum update -y
sudo yum install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
```
the first command was to update the Ubuntu linux server

the seconf command is to install apache using httpd

the third command is to start the httpd

while the last command is to enable the httpd sevice.

**Note:** When I try to install apache with `sudo install yum httpd` I am getting error, because
1. yum is used for RadHat-based systems like Redhat, Centos etc. so instead I used `apt-get` because I am using Debain-based distribution like Ubuntu that I currently using.
2. httpd is also for RedHat family while for Debain-based is `apache2`.

After changine those 2 things I was able to install apache, start and enable it.

### 2.4. Configure Apache for Website
To serve the website from the EC2 instance, configure **httpd** to point to the directory on the Linux server where the website code files are stored. Which is `**/var/www/html**`.
- Before I copied my MerketPeak code to the `**/var/www/html**`, I make sure to test the connection if apache will work, and it works after I make some changes like I have to edit the `security group` to allow inbound connection from port `80`, because apache used port 80 for his connection.
![24. Apache2 Connection](./IMG/24.%20Apache2%20Connection.png)
- Prepare the Web Directory: I make sure to clear the default apache2 web directory I found there and copy the MarketPeak Ecommerce website file to it.
```bash
sudo rm -rf /var/www/html/*
sudo cp -r ~/MarketPeak_Ecommerce/* /var/www/html/
```
![25. Copy Market](./IMG/25.%20Copy%20Market.png)

The directory **/var/www/html** is a standard directory structure on Linux system that host web content, particularly for the **Apache HTTP Server.**
- Then I restart the apache service.
```bash
sudo systemctl reload httpd
```

### 2.5. Access Website from Browser
- With **Apache2** configured and running and the website files in place, **MarketPeak Ecommerce** platform is now live on the internet.
- I then open my browser and naviagte to my AWS EC2 instance and copied my public ip address.
- Then I open another tab type type this `http://http://13.203.154.224/. Then I can view my website.
![26. Market Peak](./IMG/26.%20Market%20Peak.png)
![27. Market Peak2](./IMG/27.%20Market%20Peak2.png)

### 3. Continuous Integration and Deployment Workflow

To ensure a smooth workflow for deceloping, testing and deploying my e-commerce platform, I followed this structure approach. Which covers making changes in a development environment, utilizing version control with Git, and deploying updates to the production server on the AWS.

### Step1: Developing New Features and Fixes
- I create a new branch which I named **development** branch to enable me to abjust my code and add new features without affecting the stable version of my website.
```bash
git checkout -b development
git branch
```
![28. Git Branch](./IMG/28.%20Git%20Branch.png)
### Step2: Version Control with Git
- After I make sure I am already in my new branch which is `development`, I edit something in my index.html file which is my home page for my website.
- Then I add the new update, commit it and push it to my remote repository (GitHub).
```bash
sudo vim index.html
git status
git branch
git add index.html
git commit -m "Fixing some bugs in the index.html file"
git push origin development
```
![29. Fix Bugs](./IMG/29.%20Push%20Development.png)
### Step3: Pull Request and Merging to the Main branch
- I create a Pull Request (PR) on the GitHub to merge the development branch to the main branch.
![30. Check Push](./IMG/30.%20Check%20Push.png)
![32. Pull Request](./IMG/32.%20Pull%20Request.png)
- Then I review the changes for any potential issues, and once I am satisfied I merge the pull request to the main branch, incorporating the fix into the production codebase.
```bash
git checkout main
git merge development
```
- After I have merge the development branch to the main branch then I push the main branch to the remote repository (GitHub). 
```bash
git push origin main
```
![33. Push Main](./IMG/33.%20Push%20Main.png)
![34. Merged](./IMG/34.%20Merged.png)

### Step 4: Deploying Updates to the Production Server
- After all the steps above I push the latest update from my remote repository (GitHub) down to my local repository where I have my E-comerce website.
```bash
git pull origin main
```
- Then I restart the web server (apache2)
```bash
sudo systemctl reload apache2
```
![35. Pull Main](./IMG/35.%20Pull%20Main.png)

### Step 5: Test the New Changes
- Since the website is still open on my browser I just refresh the page to see the changes I made, which is perfect.
**Before**
![31. Change](./IMG/31.%20Change.png)
**Aftrer**
![36. Changed](./IMG/36%20.%20Changed.png)

THANKS!!!

