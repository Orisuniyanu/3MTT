# Working with Kubernetes Nodes

## What is a Node

In Kubernetes, think of a node as a dedicated workker, like a dependable employee in an office, reponsible for executing tasks and hosting containers to ensure seamless application performance. A **Kubernetes Node** is a physical or virtual machine that runs the Kubernetes and serves as a worker machine in the cluster. Nodes are reponsible for running Pods, which are basic deployable units in kubernetes. Each node in a kubernetes cluster typically represents a single host system.

## Managing Nodes in Kubernetes

Minikube simplifies the management of kubernetes for deployment and testing purposes. But in the context of minikube (a kubernetes cluster), we need to start it up before we can be able to access our cluster.

## Steps

1. I log in to the server I installed minikube to in my last project **Setting Up Minikube**.
![1. Minikube Version](./IMG/1.%20Minikube%20Version.png)
2. **Start Minikube CLuster:**

```bash
minikube start
```

This command start a local Kubernetes cluster (minikube) using a single-node Minikube setup. It provisions a virtual machine (VM) as the Kubernetes node.
![2. Minikube Start](./IMG/2.%20Minikube%20Start.png)
3. **Stop Minikube Cluster:**

```bash
minikube stop
```
Stops the running Minikube (local kubernetes), presenting the cluster state.
![3. Minikube Stop](./IMG/3.%20Minikube%20Stop.png)
4. **Delete Minikube Cluster:**

```bash
minikube delete
```

Deletes the minikube kubernetes cluster and its associated resources.
![4. Minikube Delete](./IMG/4.%20Minikube%20Delete.png)
5. **View Nodes:**
Lists all the nodes in the kubernetes cluster along with their current status.

```bash
kubectl get nodes
```

![5. Kubernetes Nodes](./IMG/5.%20Kubernetes%20Nodes.png)
6. **Inspect a Node:**
Provides detailes information about a specific node, including its capacity, allocated resources, and status.

```bash
kubectl describe node <node-name>
```

![6. Kubernetes Nodes Details](./IMG/6.%20Kubernetes%20Nodes%20Details.png)

## Node Scaling and Maintenance

Minikube as it's often used for local development and testing, scaling nodes may not as critical as in production environments. Understanding some of it concepts.

- **Node Scaling:** Minikube is typically a single-node cluster, meaning you have one worker node. For larger, production-like environments.
- **Node Upgrades:** Minikube allows you to easily upgrade your local cluster to a new Kuberntes version, ensuring that your development environment aligns with the target production version.

By effectively managing nodes in Minikube kubernetes cluster, we can create, test and deploy application locally, simulating a Kubernetes cluster without the need for a full-scale production setup. This is particularly useful for debugging, experimenting, and developing applications in a controlled environment.
