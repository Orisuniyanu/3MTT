# Working with Kubernetes Pods

**Pods in Kubernetes**

## Definition and Purpose

A Pod in Kubernetes is like a small container for running parts of an appliaction. It can have one or more containers inside it that work closely together. These containers share the same network and storage, which makes them communicate and cooperate easily. A Pod is the smallest thing you can create and manage in Kubernetes. In Minikube, which is a tool to run Kubernetes eaily. Pods are used to setup, change the size, and control applications.

## Creating and Managing Pods

Interaction with Pods in Minikube involves using powerful **`kubectl`** command-line tool. **`kubectl`** is the command-line interface (CLI) tool for interacting with Kubernetes clusters. It allows users to deploy and manage applications, inspect and manage cluster resources, and execute various command against Kubernetes clusters.

1. **List Pods:**

```bash
kubectl get po -A
```

This command provides an overview of the current status of Pods within the Minikube cluster. This command will show all the pod running on that cluster inrespective of the namespace they are in.
![1. Kubernetes Pods](./IMG/1.%20Kubernetes%20Pods.png)
2. **Inspect a Pod:**

```bash
kubectl describe pod <pod-name>
```

The command above can be used to gain detailed insight into a specific Pod, including events, container information, and overall configuration.
![2. Describe a Pod](./IMG/2.%20Describe%20a%20Pod.png)
3. **Delete a Pod:**
So to perform this task I need to run a simple pod becuse I don't want to delete the default pod running on my cluster, so I have to run **nginx** image.

```bash
kubectl run websever --image=nginx:latest
```

Then I delete the pod **webserver** I just created.

```bash
kubectl delete pod <pod-name>
```

![3. Delete Pod](./IMG/3.%20Delete%20Pod.png)
Removing a Pod from the Minikube cluster is as simple as issuing this command.

**Containers in Kubernetes**

## Definition and Purpose

**Container** represents a lightweight, standalone, and executable software package that encapsulates everything needed to run a piece of software, including the code, runtime, libaries, and system tools. Containers are fundemental units deployed within Pods, which are orchestrated by Kubernetes. In Minikube, containers play a central role in providing a consistent and portable environment for applications, ensuring they reliably across various stages of the development lifecycle.

## Integrating Containers into Pods

**Pod Definition with Containers:** In the Kubernetes world, containers come to life within Pods. Developers define a Pod YAML file that specific the containers to run, their images, and other configuration details. This Pod become the unit of deployment, representing a cohesive application.

Using **`kubectl`**, we can deploy Pods and, consequently, the containers within them to the Minikube cluster. This process ensures that the defined container work in concert within the shared context of a Pod.


**Note**
Most of my screenshoot have **k** instead of **kubectl**, this is because have already configured my alias where I can use **k** instead of the long **kubectl**.
This is possible by add the script in my home directory file **.bashrc**.
Thanks