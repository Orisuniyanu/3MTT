# Working With Docker Images

## Introduction to Docker Images

Docker images are the building blocks of containers. They are lightweight, portable, and self-sufficient packages that contain everything needed to run a software application, including the code, runtime, liberies, and system tools. Images are created from a set of instruction known as a Dockerfile, which specific the environment and configuration for the application.

## Pulling Images from DockerHub

[DockerHub](https://hub.docker.com/) is a cloud-based registry that hosts a vast collection of Docker images. Images can be pull from DockerHub to the local machine using the `docker pull` command.

To explore available images on DockerHub, the docker command provides a search subcommand. For instance, to find the Ubuntu image, you can execute this command:
```bash
docker search ubuntu
```
This command allows you discover and explore various images hosted on DockerHub by providing relevent search results.
![1. Docker Search](./IMG/1.%20Docker%20Search.png)
In the "OFFICIAL" column. the "OK" designation signifies that an images has been constructed and os officially supported by the organization responsible for the project. Once you have identified the desire image, you can retrieve it to the local machine using the "pull" subcommand.

To download the official Ubuntu image to the computer, use following command:
```bash
docker pull ubuntu
```
Executing this command will fetch the official Ubuntu image from DockerHub and store it locally on the machine, making it ready for use in creating containers.

Once an image has been successfully downloaded, we can proceed to run a container using that downloaded image by employing the "run" subcommand. Similar to the hello-world example, if an image is not present locally when the `docker run` subcommand is invoked, Docker will automatically download the required image before initiating the container.

To view the list of images that have been downloaded and are available on the local machine, enter the following command:
```bash
docker images
```
Executing this command provides a comprehensive list of all the images stored locally, allowing you to verify the of the downloaded image and gather information about its size, version, and other relevent details.
![2. Docker Pull](./IMG/2.%20Docker%20Pull.png)

## Dockerfile
A Dockerfile is a plaintext configuration file that contains a set of instructions for building a Docker image. It serves as a blueprint for creating a reproducible and consistent environment for application. Dockerfiles are fundemental to the containerization process, allowing application and its dependencies.

## Creating a Dockerfile

In this dockerfile file, I will be using an nginx image. Nginx` is an open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability.

To create a Dockerfile, I will be using a text editor of my choice, which will be vim. Start by specifying a base image, defining the working directory, copying files, installing dependencies, and configuring the runtime environment. 

Here's a simple example of a Dockerfile for a html file: 

```bash
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server
```
Explanation of the code snippet above 
1. **FROM nginx:latest:** Specifies the official NGINX base image from Docker Hub. 
2. **WORKDIR /usr/share/nginx/html/:** Specifies the working directory in the container 
3. **COPY index.html/usr/share/nginx/html/:** Copies the local `index.html` file to the NGINX default public directory, which is where NGINX serves static content from. 
4. **EXPOSE 80:** Informs Docker that the NGINX server will use port 80. This is a documentation feature and doesn't actually publish the port. 
5. **CMD:** NGINX images come with a default CMD to start the server, so there's no need to specify it explicitly.

### Steps:
1. I open my Ubuntu server on AWS logged in to it, then create a new directory for this project which I name **docker_project** 
```bash
bash
mkdir docker_project
```
![3. AWS Logged in](./IMG/3.%20AWS%20Logged%20in.png)
2. Then create a new file and vim into it.
```bash
touch index.html
nano index.html
```
3. Then put the following text inside the file.
"Welcome to Darey.io"
![4. Make Directory](./IMG/4.%20Make%20Directory.png)
4. Then create another file which is Dockerfile in the same directory, then put the script above.
![5. Move Files](./IMG/5.%20Move%20Files.png)
5. Then run the docker build command to build the image from the Dockerfile I create.
```bash
docker build -t dockerfile .
docker images # To check the image is successfully built
```
![6. Docker Build](./IMG/6.%20Docker%20Build.png)
6. Then I run a container basde on the custom NGINX image I create with the Dockerfile.
```bash
docker run -d -p 8080:80 dockerfile
```
Explaination of the command

- **docker run** - run an image to a container either present locally or it pull it from the DockerHub.
- **-d** - This is to run the container in detach mode that is it should run in background to that to give the user back the control.
- **-p** - to map port to the container so that it can be access from the host, in this case we are assigning port 8080 to the host while mapping it to port 80 on the container.
7. Now to access the page I have to set the security group to allow access inbound rule to add new rules that will allow traffic on port 8080.
8. Then go EC2 tab then click on security group then edit the inbound rule on the instance that is hosting the index.html.
![8. Security Group](./IMG/8.%20Security%20Group.png
)
9. Now I view the list of available containers
```bash
docker ps -a
```
![9. Docker PS](./IMG/9.%20Docker%20PS.png)
Now the above image show that my container is in the running state.
10. I open my browser type in my public EC2 public IP Address with the port I assign to the container.
![7. Welcome to Deray.io](./IMG/7.%20Welcome%20to%20Deray.io.png)

## Pusing Docker Images To DockerHub
In git project, where we push changes made on our local computer to a remote repository (github) so everyone can track the chages we made and also collaborate on it. Now that we have created a docker images on our own computer, we need to think about how to reuse this image in the future or how do people in other region make use of this image and possibly collaborate on it. This is where Docker Hub comes in. Let's go ahead and push our image to docker hub 
1. Create an account on [Docker Hub(https://hub.docker.com/)] which I have already as `orisuniyanu` as the user name. 
2. Create a repository on docker hub 
![10. DockerHub Repo](./IMG/10.%20DockerHub%20Repo.png)
3. Tag the Docker Image Before pushing, ensuring that the Docker image is appropriately tagged. I typically tag the image with my Docker Hub username and the repository name.
```bash
docker tag dockerfile orisuniyanu/darey.io:1.0
docker images
```
4. Then I have to logged in to my account to able to push to the DockerHub repository.
```bash 
docker login -u orisuniyanu
```
![11. DockerHub Logged In](./IMG/11.%20DockerHub%20Logged%20In.png)
5. After that I push the image I tag to the DockerHub.
```bash
docker push orisuniyanu/darey.io:1.0
```
![12. Docker Push](./IMG/12.%20Docker%20Push.png)
![13. DockerHub Pushed](./IMG/13.%20DockerHub%20Pushed.png)

