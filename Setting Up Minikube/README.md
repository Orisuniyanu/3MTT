## Setting Up Minikube

## Container Orchestration With Kubernetes
Imagine orchestrating a vibrant culinary event with various chefs preparing different dishes. Container orchestration, seamlessly coordinates each chef (container) to ensure the perfect serving, timing, and overall dining experience. Just as a skilled event planner brings order to chaos, Kubernetes, a notable orchestrator, orchestrates containers, making it the go-to choice for managing the intricate dance of modern applications. Container orchestration is a critical aspect of managing and scaling containerized applications efficiently. It involves automating the deployment, scaling, and operation of containerized applications, ensuring seamless coordination among multiple containers to deliver high availability and optimal performance. One widely used container orchestration tool is Kubernetes. Developed by Google, Kubernetes has become the de facto standard for automating the deployment, scaling, and management of containerized applications.

## What is Kubernetes?
Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Developed by Google and later open-sourced. Kubernetes is widely adopted for its ability to streamline and automate the deployment, scaling, and management of containerized applications in a highly efficient and consistent manner. It provides a centralized platform that abstracts away the complexities of distributed systems, offering features such as automated load balancing, self-healing capabilities, and seamless rolling updates.

## Componentes of a Kubernetes Cluster

**Control Plane or Master Node:** The Control Plane, often referred to as the master node, is the brain of a Kubernetes cluster. It
manages the entire cluster, making high-level decisions about the state of the system. Components like the API Server, Scheduler, Controller Manager, and etcd (key-value store for cluster data) constitute the Control Plane.

**Nodes:** Nodes are individual machines within a Kubernetes cluster responsible for running containerized applications. Each node is equipped with a container runtime (e.g., Docker), a kubelet (communicates with the master and manages containers on the node), and a kube-proxy (maintains network rules). Nodes execute and manage containers, distribute workloads, and communicate with the control plane to maintain the desired state of the system. The collaboration of multiple nodes creates a scalable and resilient environment, forming the foundation for deploying and orchestrating containerized applications in Kubernetes.

**Pods:** Pods are the fundamental deployment units in Kubernetes, representing one or more closely related containers that share the same network namespace, storage, and set of specifications. Containers within a Pod work together and are scheduled to run on the same node. Pods encapsulate the basic building blocks for deploying and scaling applications, fostering tight communication between co-located containers.

**Containers:** Containers in Kubernetes encapsulate and package applications, along with their dependencies and runtime environment, ensuring consistency across various computing environments. Leveraging containerization technology, such as Docker, containers provide a lightweight, portable, and efficient way to deploy and run applications. In Kubernetes, containers are organized into Pods, the smallest deployable units.

**API Server:** The API Server is the control plane component in Kubernetes that serves as the front end for the Kubernetes control plane. It exposes the Kubernetes API, allowing users, other components, and external entities to interact with the cluster, managing resources, and initiating various actions.

**Controller Manager:** The Controller Manager is a control plane component in Kubernetes responsible for maintaining the desired state of the cluster. It includes various controllers that watch the state of the cluster through the API Server and take corrective actions to ensure that the actual state aligns with the desired state.

**Scheduler:** The Scheduler is a control plane component in Kubernetes that assigns workloads to nodes in the cluster based on resource requirements, constraints, and availability. It plays a crucial role in distributing workloads evenly and efficiently across the worker nodes, optimizing resource utilization.

**etcd:** etcd is a distributed key-value store that acts as the cluster's single source of truth for all persistent cluster data. In Kubernetes, etcd is used to store configuration details, state information, and metadata, providing a reliable and consistent data store that ensures the integrity of the cluster's information.

**Kubelet:** The Kubelet is a vital component in Kubernetes running on each node in the cluster. It communicates with the Kubernetes control plane, specifically the API Server, to ensure that containers are running in a Pod as expected. Kubelet plays a key role in managing the containers on a node, handling tasks such as starting, stopping, and monitoring container processes based on the specifications received from the control plane.

**Kube Proxy:** Kube Proxy, or Kubernetes Proxy, is responsible for maintaining network rules on nodes. It enables communication between Pods and external entities, handling network routing and ensuring that the correct network policies are applied.

## Project Prerequisites
Completion of foundations core program 1 & 2 projects
2 CPUs or more
2GB of free memory
20GB of free disk space

## Project Goals
By the end of this project, I have:
- Gained a comprehensive understanding of Kubernetes and its fundamental concepts.
- Mastered the usage of Minikube for local Kubernetes cluster deployment and experimentation.
- Acquired hands-on experience with Docker, understanding containerization principles and how to create, manage, and distribute containerized applications.
- Built and deployed applications on minikube

## Minikube
Minikube is an open-source tool that enables us to run Kubernetes clusters locally our machines. As we now know that kubernetes is a container orchestration platform that automates the deployment, scaling, and management of containerized applications. Minikube streamlines the creation of a local Kubernetes environment, providing a user-friendly playground where we can safely build and test their applications before deploying them to a production setting.

## Getting Started With Minikube

### Installing Minikube on Windows
To install minikube on windows, we need to use [chocolatey(https://chocolatey.org/)]. Chocolatey, just like linux apt' and 'yum', is a windows package manager for installing, updating and removing software packages on windows.

# Steps to Install Minikube
1. I open my laptop and then go to my settings to see if my laptop get all the requirement for this project and to install minikube, in which it met all the requirement.
![1. About PC](./IMG/1.%20About%20PC.png)
2. I open my window server then Go to the windows search bar and launch a terminal with administrative access. 
![2. Terminal](./IMG/2.%20Terminal.png)
3. Then I try to install minikube using choco installer package for windowns but it result in failure.
![3. Choco Installing](./IMG/3.%20Choco%20Installing.png)
4. The result above shows that I don't have chocolatey install on my environment, then I navigate to the official website of [chocolatey](https://chocolatey.org/install), where I followed the guild provided.
![4. Chocolatey Installation](./IMG/4.%20Chocolatey%20Installation.png)
5. Then I start running the command provided.
```powershell
Get-ExecutionPolicy
```
The command above result to `Restricted` which means that there's policy that will prevent the installation of the package.
6. Then I run the next command to bypass the policy in place.
```powershell
Set-ExecutionPolicy AllSigned
```
![6. AllSigned](./IMG/6.%20AllSigned.png)
7. After that I run the next command to install the choco package.
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
![7. Choco Installed](./IMG/7.%20Choco%20Installed.png)
8. Then I run the following command to check if it's installed properly with the following command.
```powershell
choco --version
choco -?
```
![8. Choco Version](./IMG/8.%20Choco%20Version.png)
9. After installing choco I now go ahead to install minikube with the just installed package.
```powershell
choco install minikube
```
![9. Install Minikube](./IMG/9.%20Install%20Minikube.png)
10. Then I check if minikube is installed successfully.
```powershell
minikube version
```
![9. Install Minikube](./IMG/9.%20Install%20Minikube.png)
11. Since minikube need docker as the driver and also to pull it's base image, therefore I went ahead to install docker for windows, by going to the [official docker desktop website](https://docs.docker.com/desktop/setup/install/windows-install/).
![11. Docker Desktop](./IMG/11.%20Docker%20Desktop.png)
12. After downloading the docker desktop then I click on the downloaded file and the installation start.
![12. Docker Desktop Instaling](./IMG/12.%20Docker%20Desktop%20Instaling.png)
13. Then I launch the docker desktop.
![14. Docker Start](./IMG/14.%20Docker%20Start.jpg)
14. Then on the terminal I run the following command.
```powershell
minikube start
```
![13. Minikube Start](./IMG/13.%20Minikube%20Start.jpg)
