# Introduction to Docker and Containers
## What are Containers? 
In realm of software development and deployment, professionals used to face a dilemma. They crafted brilliant code on their local machines, only to find that when deployed to other environments, it sometimes does not work. The culprit? The notorious "it works on my machine" phenomenon.

Get started with Docker, a tool that emerged to a major problem IT industry. A man named Solomon Hykes, who, in 2013, unveiled Docker, a containerisation platform that promised to revolutionize the way IT professionals built, shipped, and ran applications. 
Imagine containers as magical vessels that encapsulate everything an application needs to run smoothly - its code, libraries, dependencies, and even a dash of configuration magic. These containers ensure that an application remains consistent and behaves the same, whether it's running on a developer's laptop, a testing server, or a live production environment. Docker had bestowed upon IT professionals the power to say goodbye to the days of "it works on my machine."

Docker simplifies the deployment process, making it as easy as waving a wand. Gone are the days of wrestling with complex installation procedures and compatibility issues. Docker containers provide a standardized, portable environment, ensuring that your applications run seamlessly across various platforms. 

## Advantages of Containers 

**Portability Across Different Environments:** In the past, deploying applications was akin to navigating a treacherous maze, with compatibility issues lurking at every turn. Docker's containers, however, encapsulate the entire application along with its dependencies and configurations. This magical package ensures that your creation dances gracefully across different platforms, sparing you from the woes of the "it works on my machine" curse. With Docker, bid farewell to the headaches of environment mismatches and embrace a world where your application reigns supreme, irrespective of its hosting kingdom. 

**Resource Efficiency Compared to Virtual Machines:** Docker containers share the underlying host's operating system kernel, making them lightweight and nimble. This efficiency allows you to run multiple containers on a single host without the extravagant resource demands of traditional virtual machines. Picture Docker containers as magical carriages, swiftly transporting your applications without burdening the kingdom with unnecessary excess. With Docker, revel in the harmony of resource optimization and application efficiency.

**Rapid Application Deployment and Scaling:** Docker containers can be effortlessly spun up or torn down, facilitating the swift 
deployment of applications. Whether you're facing a sudden surge in demand or orchestrating a grand-scale production, Docker allows you to scale your applications seamlessly. Imagine commanding an army of containers to conquer the peaks of user demand, only to gracefully retreat when the storm has passed. With Docker, the ability to scale becomes a wand in your hand, transforming the challenges of deployment into a choreographed ballet of efficiency.

## Comparison of Docker Container with Virtual Machines
Docker and virtual machines (VMs) are both technologies used for application deployment, but they differ in their approach to virtualization. Virtual machines emulate entire operating systems, resulting in higher resource overhead and slower performance. In contrast, Docker utilizes containerization, encapsulating applications and their dependencies while sharing the host OS's kernel. This lightweight approach reduces resource consumption, provides faster startup times, and ensures portability across different environments. Docker's emphasis on microservices and standardized packaging fosters scalability and efficiency, making it a preferred choice for modern, agile application development, whereas virtual machines excel in scenarios requiring stronger isolation but at the cost of increased resource usage. The choice between Docker and VMs depends on specific use cases and the desired balance between performance and isolation.

## Importance of Docker 
Technology and Industry Impact: The significance of Docker in the technology landscape cannot be overstated. Docker and 
containerization have revolutionized software development, deployment, and management. The ability to package applications and their dependencies into lightweight, portable containers addresses key challenges in software development, such as consistency across different environments and efficient resource utilization. 
Real-World Impact: Implementing Docker brings tangible benefits to organizations. It streamlines the development process, promotes collaboration between development and operations teams, and accelerates the delivery of applications. Docker's containerization technology enhances scalability, facilitates rapid deployment, and ensures the consistency of applications across diverse environments. This not only saves time and resources but also contributes to a more resilient and agile software development lifecycle.

## Getting Started with Docker

### installing Docker
1. I open Oracle Virtual box and start my ubuntu desktop I have there, then connect to the server through putty using ssh (port 22).
![1. Ubuntu Version](./IMG/1.%20Ubuntu%20Version.png)
2. After that the first thing I did was to update and refresh my package list on a Debian-based system, to ensure the latest software information is available to install.
```bash
sudo apt-get update
```
![2. Update](./IMG/2.%20Update.png)
3. Then I add [Docker's Official GPG key](https://help.ubuntu.com/community/GnuPrivacyGuardHowto)
This Linux command will installs essential packages including certificate authorities, a data transfer tool (curl), and the GNU Privacy Guard for secure communication and package verification.
```bash
sudo apt-get install ca-certificates curl gnupg
```
4. Then I create a directory (/etc/apt/keyrings) with specific permissions (0755) for storing keyrings files, which are used for docker's authentication.
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
![3. Docker Version](./IMG/3.%20Docker%20Version.png)
5. After I downloads the Docker GPG key using `curl`.
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
6. Then I set read permission for all users on the Docker GPG key files within the APT keyring directory.
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
7. Now I add the repository to APT sources
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
The **"echo"** command creates a Docker APT repository configuration entry for Ubuntu system, incorporating the systen architecture and Docker GPG key, and then "sudo" tee /etc/apt/source.list.d/docker.list > /dev/null" write this configuration to the "/etc/apt/source.list.d/docker.list" file.
7. Then I install the latest version od docker
```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
![4. Install Docker](./IMG/4.%20Install%20Docker.png)
8. Then I verify that docker has been successfully installed.
```bash
docker versiom
docker --version
which docker
```
![5. Docker Version](./IMG/5.%20Docker%20Version.png)
9. Then i check if docker service is running, which it is.
```bash
sudo systemctl status docker
```
![6. Start Docker](./IMG/6.%20Start%20Docker.png)
10. So by default, after installing docker, it can only be run by root user or using **"sudp"** command. To run the docker command without sudo, I have to run the below command, after that I can run docker command without using superuser privilledges.
```bash
sudo usermod -aG docker iemmanuel
newgrp docker
```
![7. Docker Groups](./IMG/7.%20Docker%20Groups.png)

## Running the "Hello World" Container

**Using the `docker run` Command**

The `docker run` command is the entry point to execute containers in Docker. It allows to create and start a container based on a specified Docker images. The most straightforward example is the ""Hello World" container, a minimalistic container that print a greeting message when executed.
```bash
# Run the "Hello World" container
docker run hello-world
```
![8. Docker World](./IMG/8.%20Docker%20World.png)

When executing a Docker command, Docker takes the following steps:
1. Pulls Image (if not available locally):
Docker checks if the specified image, like hello-world, is stored locally. If it's not found, Docker automatically retrieves it from Docker Hub, a central repository for Docker images.
2. Creates a Container:
Docker creates a container based on the specified image. This container is a running instance of the image, complete with its own isolated file system and runtime environment.
3. Starts the Container:
The newly created container is started and executes the command defined within the image, which in the case of hello-world, is designed to print a simple message.

## Understanding the Docker Image and Container Lifecycle 
**Docker Image:** A Docker image is a lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Images are immutable, meaning they cannot be modified once created. Changes result in the creation of a new image. 
**Container Lifecycle:** Containers are running instances of Docker images. 
- They have a lifecycle: `**create**, **start**, **stop**, and **delete**. `
- Once a container is created from an image, it can be started, stopped, and restarted.

**Verifying the Successful Execution**
- I check the image on my local environment.
```bash
docker images
```
![9. Docker Images](./IMG/9.%20Docker%20Images.png)

## Basic Docker Commands

### Docker Run

The `docker run` command is fundamental for executing containers. It create and start a container based on specified images.
```bash
# Run a container based on the "nginx" image
docker run hello-world
```

### Docker PS

The `docker ps` command displays a list of running containers. This is useful for monitoring active contaiers and obtaining information such as container IDs, name, and status.
```bash
# List running containers
docker ps
```
To view all containers, including those that have stopped, add the `**-a**` option:
```bash
# List all containers (running and stopped)
docker ps -a
```

### Docker Stop
The `docker stop` command halts a running container.
```bash
# Stop a running container (replace CONTAINER_ID with the actual container ID)
docker stop CONTAINER_ID
```

### Docker Pull
The `docker pull` command downloads a Docker image from a registry, such as Docker Hub, to your local machine.
```bash
# Pull the latest version of the "ubuntu" image from Docker Hub
docker pull ubuntu
```

### Docker Push
The `docker push` command uploads a local DOcker images to a registry. making it available for others to pull.
```bash
# Push a local image to Docker Hub
docker push your-username/image-name
```
For this command to successful push you have to logged in to Docker Hub using `docker login` before pushing images.

### Docker Images
The `dockerimages` command lists all locally available Docker images.
```bash
# List all local Docker images
docker images
```

### Docker RMI
The `docker rmi` command removes one or more images from the local machine.
```bash
# Remove a Docker image (replace IMAGE_ID with the actual image ID)
docker rmi IMAGE_ID
```
![10. Docker All](./IMG/10.%20Docker%20All.png)
These basic Docker command provides a foundation foe working with containers. Understanding how to run, list, stop, pull, push, and manage Docker images is crucial for effective containerization and orchestration.