# Jenkins Pipeline Job

## What is a Jenkins Pipeline Job
A Jenkins pipeline job is a way to define and automate a series of steps in the software delivery process. It allows to script and organize the entire build, test, and deployment. Jenkins pipelines enables organizations to define, visualize, and execute intricate build, test, and deployment processes as code. This facilitates the seamless integration of continuous integration and continuous delivery (CI/CD) practices into software development.

I'm going to use the dockerfile image I created in the docker foundation project in this project.

## Creating a Pipeline Job
1. Back to the Jenkins dashboard, on the menu on the left side, click on **New Item**.
![1. New Item](./IMG/1.%20New%20Item.png)
2. Then I name this pipeline **My pipeline job** and select **Pipeline** under item type.
![2. Pipeline Job](./IMG/2.%20Pipeline%20Job.png)
3. Then on the left side click on **Triggers** then tick the box for **GitHub hook trigger for GITScm polling?** and save it.
![3. Trigger](./IMG/3.%20Trigger.png)
Since I have created a GitHub webhook previously in my last project I don't need to create another one again.

## Writing Jenkins Pipeline Script

A jenkins pipeline script refers to a script that defines and  orchestrates the steps and stages of a continuous integration and continuous delivery (CI/CD) pipeline. Jenkins pipelines can be defined using either declarative or scripted language to describe the pipeline stages, steps, and other configurations while scripted syntax provides more flexiblity and is suitable for complex scripting requirements.

Here's my pipeline script
```bash
pipeline {
    agent any
    stages {
        stage('Connect To GitHub') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Orisuniyanu/jenkins-scm.git'
                    ]]
                ])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t dockerfile .'
                }
            }
        }
        stage('Run Docker Container') { 
            steps {
                script {
                    sh 'docker run -itd -p 8081:80 dockerfile'
                }
            }
        }
    }
}
```

## Explanation of the Script Above

The provided Jenkins pipeline script defines series of stage for a continuous integration and continuous delivery (CI/CD) process. Let's breakdown each stage:

- **Agent Configuration:**

```bash
agent any
```
Specifies that the pipeline can run on any available agent (an agent can either be a Jenkins master or node). This means the pipeline is not tied to a specific node type.

- **Stages:**

```bash
stages {"\n      // Stages go here\n   "}
```
Defines the various stages of pipeline, each representing a phase in the software delivery process.

- **Stage 1: Connect To GitHub:**

```bash
stage('Connect To Github') {"\n      steps {\n         checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RidwanAz/jenkins-scm.git']])\n      "}
}
```
- This stage checks out the source code from a GitHub repository (`**https://github.com/Orisuniyanu/jenkins-scm.git**).
- It specifies that the pipeline should use the 'main' branch.

- **Stage 2: Build Docker Image:**
```bash
stage('Build Docker Image') {"\n      steps {\n         script {\n            sh 'docker build -t dockerfile .'\n         "}
   }
}
```
- This stage builds a docker image named 'dockerfile' using the source code obtained from the Github repository.
- The `**docker build**` command is executed using the shell (`**sh**`).

- **Stage 3: Run Docker Container:**
```bash
stage('Run Docker Container') {"\n      steps {\n         script {\n            sh 'docker run -itd --name nginx -p 8081:80 dockerfile'\n         "}
   }
}
```
- This stage runs Docker container names 'nginx' in detached mode (`**-itd**`).
- The container is mapped to port 8081 on the host machine (`**-p 8081:80**`).
- The Docker image used is the one built in the previous stage ('dockerfile').

4. After written the pipeline script then I copied it and paste it under Pipeline script, then click on **Pipeline Syntax**.
![4. Pipeline Syntax](./IMG/4.%20Pipeline%20Syntax.png)
5. After that another tab was opened, then under **Sample Step** I select **checkout: Check out from version control**.
![5. Generator](./IMG/5.%20Generator.png)
6. Then I paste my GitHub URL to the provided space and change the branch from master to main.
![6. Pipeline Syntax](./IMG/6.%20Pipeline%20Syntax.png)
7. Then click on **Generate Pipeline Script**
![7. Generate Pipeline Script](./IMG/7.%20Generate%20Pipeline%20Script.png)
8. Then I copied the generated syntax and paste and replace the checkout stage.
![8. CheckOut](./IMG/8.%20CheckOut.png)

## Installing Docker

Before Jenkins can run docker commands, we need to install docker on the same instance Jenkins was installed. I will be installing the docker with a shell script to demostarte my knowledge in shell scripting.

1. Open my EC2 instance through putty application.
![9. Putty](./IMG/9.%20Putty.png)
2. Then I create a new file which I name **docker.sh** with **vim** text editor the paste the below commands and save it with **:wq!**.
![10. VIM](./IMG/10.%20VIM.png)

### Explaination of the command inside the script
1. Update package index
```basg
sudo apt-get update -y
```
- sudo: Runs the command with administrator (root) privileges.

- apt-get update: Updates the list of available packages and their versions from all configured sources.

- -y: Automatically says "yes" to any prompts.

2. Install required dependencies
```bash
sudo apt-get install ca-certificates curl gnupg
```
- ca-certificates: Contains root certificates to authenticate SSL connections.

- curl: A command-line tool to fetch data from URLs (like downloading files).

- gnupg: Used for encryption and signing data (here, it helps verify Docker's authenticity).
3. Create a directory for Docker’s GPG key
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
- install: Not just for copying files; also used to create directories with specific permissions.

- -m 0755: Sets the permissions (owner can read/write/execute; others can read/execute).

- -d: Create a directory.

- /etc/apt/keyrings: A secure location for storing third-party GPG keys.
4. Download Docker’s GPG key and save it
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
- curl -fsSL: Downloads the file quietly and fails silently on errors.

- |: Pipes the output to the next command.

- gpg --dearmor: Converts the key from ASCII-armored format to binary.

- -o: Specifies the output file.
5. Set permissions for the Docker GPG key
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
- chmod a+r: Gives all users (a) read (r) access to the key file.

6. Add Docker's official repository
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- dpkg --print-architecture: Gets your system’s architecture (e.g., amd64).

- /etc/os-release and $VERSION_CODENAME: Detects your Ubuntu version codename (e.g., jammy, focal).

- signed-by=...: Ensures the repository uses the specified trusted GPG key.

- tee: Writes the output to the Docker repository file.

- > /dev/null: Prevents output from being shown on screen.

7. Update package index again
```bash
sudo apt-get update -y
```
- Necessary to include the new Docker repo in the package index.

8. Install Docker Engine and components
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```
- docker-ce: Community Edition of Docker.

- docker-ce-cli: Docker command-line interface.

- containerd.io: Container runtime used by Docker.

- docker-buildx-plugin: Enhances Docker's build command with more features.

- docker-compose-plugin: Enables use of docker compose command.

- -y: Confirms installation automatically.

9. Check Docker service status
```bash
sudo systemctl status docker
```
- systemctl status: Shows if Docker is running and its overall health.

3. Then I make the file executable by adding x permission for user which is basically me.
```bash
chmod u+x docker.sh
```
4. Then I execute the file
```bash
./docker.sh
```
![11. Install Docker](./IMG/11.%20Install%20Docker.png)
And docker is installed and running 
![12. Docker Running](./IMG/12.%20Docker%20Running.png)

5. Then I create another file for docker file which is named **Dockerfile** the paste the following syntax inside the file.
```bash
vim Dockerfile

# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80
```
6. Also I create another file which is **index.html** and paste the following in it.
```bash
vim indec.hml

Congratulations, You have successfully run your first pipeline code.
```
![13. Dockerfile](./IMG/13.%20Dockerfile.png)
7. Then I push the 2 files to my remote repository.
```bash
git init
git add .
git remote add origin https://github.com/Orisuniyanu/jenkins-scm.git
git remote -v
git pull origin main --allow-unrelated-histories
git pull origin main --rebase
git push -u origin main
```
![14. Git Push](./IMG/14.%20GIt%20Push.png)

8. Then went back to the Jenkins and check it was ran successfully.
![15. Console Output](./IMG/15.%20Console%20Output.png)
9. Then open my AWS account and go to the EC2 instance dashboard and click on **Security group** under Network & Securuty, then click on **Edit inbound rule**.
![16. Security Group](./IMG/16.%20Security%20Group.png)
10. Then click on **Add rule** then allow port 8081 which is the port our docker container is running on, then click on **Save rule**.
![17. Inbound Rule](./IMG/17.%20Inbound%20Rule.png)
11. After that I copied my public Ip address then open my browser and type this URL 
http://54.153.82.196:8081/
![18. Website](./IMG/18.%20Website.png)
This show my project is successful executed.