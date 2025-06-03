# Introduction to Jenkins

## Introduction to CICD
Continuous Integration and Continuous Delivery (CI/CD) is a set of best practice and methodologies that revolutionize the software development lifecycle by enhancing efficiency, reliablity, and speed. CI/CD represents a seamless integration of automation and collaboration throughout the developement process, aiming to deliver high-quality software consistently and rapidly. In the realm of CI, developers regularly integrate their code changes into a shared repository, triggering automated builds and tests to detect integration issues early. On the other hand, CD encompasses both Continuous Delivery and Continuous Deployment, ensuring that software is always in a deployable state and automating the deployment process for swift and reliable release. The CI/CD pipeline fosters a culture of continuous improvement, allowing development teams to iterate quickly, reduce manual interventions, and deliver software with confidence.

## What is Jenkins

Jenkins is widely employed as a crucial CI/CD tool for automating software debvelopment processes. Teams utlilze Jenkins to automate building, testing, and deploying applications, streamlining the development lifecycle. With Jenkins pipelines, developers can define, version, and execute entire workflows as code. ensuring consistent and reproducible builds. Integration with version control systems allows Jenkins to trigger build automatically upon code changes, facilitating early detection of issues and enabling teams to deliver high-quality software at a faster peace. Jenkins' flexibility, extensibility through plugins, and support for verious tools make it a preferred choice for organization aiming to implement efficient and automated DevOps practices.

## Project Goals:
1. Developed a foundational understanding of Continuous Integration (CI) and Continuous Delivery (CD) principles, and articulate their role in improving software development processes.

2. Acquired proficiency is using Jenkins by mastering installtion, configuration, and navigation through the Jenkins user interface, and gain hands-on experience in creating and managing Jenkins jobs.

3. Learned the end-to-end process of automating software builds, running automated tests, and deploying applications using Jenkins, fostering a practical understanding of CI/CD pipelines. Apply best practices in CI/CD processes, including parameterized builds, integration with external tools, and leveraging containerization technologies like Docker.

## Getting Started With Jenkins

1. I open putty application and connect to my ubuntu instance on AWS through SSH on port 22, after coping my public IP Address from the EC2 instance dashboard.
![1. Putty](./IMG/1.%20Putty.png)
2. Then I update and upgrade my package repositories.
```bash
apt-get update && apt-get upgrade -y
```
![2. Update](./IMG/2.%20Update.png)
3. Then I install JDK
```bash
sudo apt install default-jdk-headless
```
![3. JDK Installed](./IMG/3.%20JDK%20Installed.png)
4. After that install Jenkins.
```bash
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt-get install jenkins
```
![4. Install Jenkins](./IMG/4.%20Install%20Jenkins.png)
- **wget** -- Downloads files from the internet
- **-q** -- Runs quietly (no output).
- **-0** -- Sends the downloaded file to standard output instead of saving it
- **https://pkg.jenkins.io/debian-stable/jenkins.io.key** -- The URL of the Jenkins GPG key.
- **|** -- Pipes the downloaded key into the next command.
- **sudo** -- Runs the command with administrator privileges.
- **apt-key add -** -- Adds the key to the system's trusted keys (the - tells apt-key to read from standard input).
- **sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list'** -- This command adds the Jenkins repository to your system's package sources, allowing you to install Jenkins via apt
This command install Jenkins. It involves importing the Jenkins GPG key for package verification, adding the Jenkins repository to the system's sources, updating package lists, and finally, installing Jenkins through the package manager (apt-get).

5. Then I check if Jenkins has been installed, and it is up and running
```bash
sudo systemctl status jenkins
```
![5. Jenkins Status](./IMG/5.%20Jenkins%20Status.png)

6. After that to allow traffic through port 8080 which is the port Jenkins is using, I went to the EC2 instance security group and and create an inbound rule that allows traffic for port 8080.
- On the EC2 instance dashboard, under **Network & Security** I select **Security Groups**.
![6. Security Group](./IMG/6.%20Security%20Group.png)
- Then click on **Edit inbound rules** which only has **SSH** only before.
- Then I click on **Add rule** under type I select **Custom TCP**, under Port range **8080**, under source I select **Anywhere-IPv4** then make sure it's 0.0.0.0/0 so that all ip address on port 8080 can access the jenkins.
- After all these I click on **Save rule**.
![7. Add Rules](./IMG/7.%20Add%20Rules.png)

7. Then I click on Instance still on the EC2 instance and copied my public Ip address, then open my browser and type in this **http://54.67.47.114:8080**.
![8. Jenkins Running](./IMG/8.%20Jenkins%20Running.png)
8. Then navigate to this directory and cat this file to get my Admin password.
```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```
![9. Password](./IMG/9.%20Password.png)
9. Then copy the password and paste it in the Jenkins webpage.
![10 Logged IN](./IMG/10%20Logged%20IN.png)
10. Then click on Install suggested plugins, this is to install the likely plugins I will need to executed my pipeline stages.
![11. Plugins](./IMG/11.%20Plugins.png)
11. After that I was promt to create my first Admin user, which I name **Assilo**
![12. Admin User](./IMG/12.%20Admin%20User.png)
12. After that I was able to log in to the Jenkins interface homepage.
![13. Jenkins](./IMG/13.%20Jenkins.png)

## Jenkins Jobs (Freestyle)
1. Then I started by creating my first job, where I click on **New Item**.
![14. New Item](./IMG/14.%20New%20Item.png)
2. Then give it a name which I name **FreeStyle**, then click on Freestyle project, then click on **OK**.
![15. Freesytle Job](./IMG/15.%20Freesytle%20Job.png)
3. Under build steps, I click on **Execute shell**
4. Then I type the followinf command
```bash
echo "Hello Jenkins Famliy, I am learning Jenkins finally!"
```
![16. Save](./IMG/16.%20Save.png)
Then save the configuration and ran it to see how it works.
5. After that I click on build now to run the Jenkins pipeline which is successful.
![17. Freesyle Good](./IMG/17.%20Freesyle%20Good.png)

## Integrate GitHub to Jenkins

1. I click on **Manage Jenkins** on the dashboard 
![18. Manage Jenkins](./IMG/18.%20Manage%20Jenkins.png)
2. Then click on **Plugins**, then click on **Installed Plugins** this is to see if I have git plugins installed on my Jenkins which is present already.
![19. GitHub Plugins](./IMG/19.%20GitHub%20Plugins.png)
3. Still in the Manage Jenkins, I click on **Credentials** 
![20. Credentials](./IMG/20.%20Credentials.png)
4. Then click on **global**
![21. Global](./IMG/21.%20Global.png)
5. Then under Kind I leave to username and password and type in my GitHub username and password with ID for easily identification.
![22. GitHub Integration](./IMG/22.%20GitHub%20Integration.png)

## Pipeline 
1. I click on **New Item**, name it **Challenge 2** and select Pipeline as the item type.
![23. Pipeline Job](./IMG/23.%20Pipeline%20Job.png)
2. On the configuration page, under pipeline I select **Pipeline script** and type in the following script
```bash
pipeline {
    agent any
    stages {
        stage ("Stage 1") {
            steps {
                echo "This is stage 1"
            }
        }
        stage ("Stage 2") {
            steps {
                echo "This is stage 2"
            }
        }
        stage ("Stage 3") {
            steps {
                echo "This is stage 3"
            }
        }
        stage ("Stage 4") {
            steps {
                echo "This is stage 4"
            }
        }
        stage ("Stage 5") {
            steps {
                echo "This is stage 5"
            }
        }
    }
}
```
Then save it and click on Build now 
3. Then this is the result
![24. Challenge 2](./IMG/24.%20Challenge%202.png)

