# Working With Docker Container

## Introduction to Docker Container

Docker container are lightweight, portable, and executable units that encapsulate an application and its dependencies. 

I will dive deep into the basics of working with Docker containers, from launching containers to managing their lifecycle.

## Running Containers
To run a container, we use `docker run` command followed by the name of the image we want to use.

## Steps:
1. Open my ubuntu server through ssh on putty application.
![1. Putty](./IMG/1.%20Putty.png)
2. Then see the images I have locally on my machine.
```bash
docker images
```
![2. Docker Images](./IMG/2.%20Docker%20Images.png)
3. Since I have ubuntu image locally I will start the container.
```bash
docker run ubuntu
docker ps -a
```
![3. Docker PS](./IMG/3.%20Docker%20PS.png)
The image above shows that the container is created but not running, like it existed immediately. 
I start the container by running
```bash
docker start 6f4
docker ps -a
```
![4. Docker Start](./IMG/4.%20Docker%20Start.png)

## Launching Container with Different Options
Docker provides various options to customize the behavior of containers. For example, I can specify variables, map ports, and mount volumes. Here's an example of running a container with specific environment variable:
```bash
docker run -e "MY_VARIABLE=my-value" ubuntu
```
## Running Containers in the Background
By defaut, containers run in the foreground, and the terminal is attached to the container's standard input/output. To run a container in the background, use the **`-d`** option:
```bash
docker run -d ubuntu
```
This command starts a container in the background, allowing to continue using the terminal.
![5. Docker in Background](./IMG/5.%20Docker%20in%20Background.png)

## Container Lifecycle
Containers have a lifecycle that inclused creating, starting, stopping, and restarting. Once a container is created, it can be started and stopped multiple times.

### Starting, Stopping, and Restarting Containers

- To start a stopped container container:
```bash
docker start dockerfile
```
This commands above is to check the running container 
- To stop a running container:
```bash
docker stop container_name
```
- To restart a container:
```bash
docker restart container_name
```

## Removing Containers
To remove a container, we use `docker rm` command followed by the container's ID or name:
```bash
docker rm ubuntu
```
This deletes the container, but keep the associated images remains on the system.

1. To check Information about the hosting machine and the docker engine and the machine hosting the docker.
```bash
uname -a
```
![12. Uname](./IMG/12.%20Uname.png)
```bash
docker info
```
![6. Docker Info](./IMG/6.%20Docker%20Info.png)
2. To check information about a docker image or container
```bash
docker inspect <container_name or id>
docker inspect <image_name or id>
```
![7. Docker Inspect](./IMG/7.%20Docker%20Inspect.png)
![8. Docker Inspect Image](./IMG/8.%20Docker%20Inspect%20Image.png)

3. To start my container that is not running.
![9. Docker Containers](./IMG/9.%20Docker%20Containers.png)
Or to start a new container from a static image
```bash
docker run -d -p 8080:80 dockerfile:latest
```
**Command Breakdown:**
- **docker run** -- Starts a new container.
- **-d** -- Runs the container in detached mode (background process).
- **-p 8080:80** --  Maps port 80 inside the container to port 8080 on the host machine.
- **dockerfile:latest** -- Specifies the image to use ( dockerfile with the latest tag).

![13. Docker Run](./IMG/13.%20Docker%20Run.png)

4. To stop a running container.
![10. Docker Stop](./IMG/10.%20Docker%20Stop.png)

5. To restart the stopped container
![14. Docker Restart](./IMG/14.%20Docker%20Restart.png)

6. To remove the container.
![11. Docker Remove](./IMG/11.%20Docker%20Remove.png)
- **docker ps** -- To see the container running presently
- **docker rm** -- To remove delete container from the docker environment, but I run it to prove that a container must be stopped before it can be remove or delete.
- **docker ps -a** -- To see all the conatiner including the running container and those that are not running.
