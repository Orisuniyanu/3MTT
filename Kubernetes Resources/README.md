# Working With Kubernetes Resources

## Introudction To YAML

A Kubernetes YAML file is a text file written in YAML syntax that describe and defines Kubernetes resources. YAML is a human-readbable data serialization format that is commonly used for configuration files. In the context of Kubernetes, these YAML files serve as a declarative way to specify the desired state of the resources such as pods, container, service and deployment you want to deploy and manage within a Kubernetes cluster.

## Basic Structure of YAML File

YAML uses indentation to represents the hierachy of data, and it uses whitespace (usually space, not tabs) for indentation.

Example:

```yaml
key1: value1
key2:
  subkey1: subvalue1
  subkey2: subvalue2
key3:
  - item1
  - item2
```

## Data Types

**Scalars:** Scalars are single values.

- Strings:

```yaml
name: John Doe
```

- Numbers:

```yml
age: 25
```

- Booleans:

```yaml
is_student: true
```

**Collections:**

- Lists (arrays):

```yaml
fruits:
  - apple
  - banana
  - orange
```

- Maps (key-value pairs):

```yaml
person:
  name: Alice
  age: 30
```

**Nested Structure:** YAML allows nesting structures:

```yaml
employee:
  name: John Doe
  position: developer
  skills:
    - Python
    - JavaScript
```

**Comments:**
In YAML, comment start with **`#`**

```yaml
# This is a comment
key: value
```

**Multiline Strings:**
Multiline strings can be represented using **`|`** or **`>`** characters:

```yaml
description: |
  This is a multiline
  string in YAML.
```

**Anchors and Aliases:**
You can use **`&`** to create an anchor and **`*`** to create an alias:

```yaml
first: &name John
second: *name
```

So this is more like setting a variables. In this example, **`second`** has the same value as **`first`**.

Now that we've got the basic, practice and reading YAML to become confortable with its syntax. It's widely used in configuration files for various tools and systems.

## Deploying Applications in Kubernetes

In Kubernetes, deploying applications is a fundemental skills. Deployment involves the process if taking your application code and running it on a Kubernetes cluster, ensuring that it scales, manages resource efficiently, and stays resilient. This hand-on project will guild me through deploying application using Minikube, a lightweight, single-node Kubernetes cluster perfect for development or testing.

## Deployments in Kubernetes

In Kubernetes, a **Deployment is a declarative approach to managing and scaling applications. It provides a blueprint for the desired state of the application, allowing Kubernetes to handle the complexities of deploying and managing replicas. Whether you're running a sinple web serber or a more complex microservices architecture, Deployment are the cornerstone for maintaining application consistency and availability.

## Service in Kubernetes

Once the application is deployed, it needs a way to be accessed by other perts of the system or external users. This is where **Service** cone into play. In Kubernetes, a Service is an abstraction that defines a logical set of Pods and a policy by which to access them. It acts as a stable endpoint to connect to the application, allowing for easy communication within the cluster or external sources. Some of the several types of Services in Kubernets;

**- ClusterIP:** Purpose: The default type. Expose the service in a cluster internal IP. Accessible only within the cluster.

**-NodePort:** Exposes the Service on each Node's IP at a static port (NodePort). Accessible externally using **`NodeIP`**.

**-LoadBalancer:** Exposes the Service externally using a cloud provider's load balancer. Accessible externally through the load balancer's IP.

In subsequent sections. I will dive deep into deployment strategies and service configuration within the kubernetes ecosystem, delving into the intricacies of these componenets to ensure a thorough understanding and proficiency in their utilization.

**Deploying a Minikube Sample Application:** Using YAML files for deployments and services in Kubernetes is like cratfting a detailed plan of the application, while direct deployment with `kubectl` commands is more like giving quick, on-the-spot intructions to launch and manage the application. Let's create a minikube deployment and service with `kubectl`.

```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
```

![1. Kubectl Deployment](./IMG/1.%20Kubectl%20Deployment.png)

The command above creates a Kubernetes Deployment named "hello-minikube" running the "kicbase/echo-server:1.0" container image

```bash
kubectl expose deployment hello-minikube --type=NodePort --port=8080
```

The command above exposes the Kubernetes Deployment named "hello-minikube" as a NodePort service on port 8080.

```bash
kubectl get services hello-minikube
```

![2. Kubectl Service](./IMG/2.%20Kubectl%20Service.png)
The easiest way to acccess this service is to let minikube launch a web browser for you

```bash
minikube service hello-minikube 
```

![3. Minikube Web Browser](./IMG/3.%20Minikube%20Web%20Browser.png)
As you can see from the above screenshoot the web browser can't be open because there's no GUI on my environment. So what I do is to tunnel the minikube port to another VM that has GUI installed.
`Minikube uses a private network interface, and when you forward a port (via SSH tunnel or minikube service), it binds to localhost (127.0.0.1) by default — not the VM's IP address.`
This is possible by using putty `SSH TUNNEL CONFIGURATION`.
![7. Putty Tunnel](./IMG/7.%20Putty%20Tunnel.png)
![4. Minikube Tunnel](./IMG/4.%20Minikube%20Tunnel.png)

## Working With YAML Files

I already have an image push to dockerhub. Now we are going to reuse the image in our YAMl script for deployment.

## Step

1. Create a new folder I will use for this project which I named `my-nginx-yaml` and also navigate to the directory.

```bash
mkdir my-nginx-yaml
cd my-nginx-yaml
```

![5. Make a Directory](./IMG/5.%20Make%20a%20Directory.png)

2. Then I create a new file inside the directory I created in the first step, which is name `nginx-deployment.yaml`.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-nginx
  template:
    metadata:
      labels:
        app: my-nginx
    spec:
      containers:
      - name: my-nginx
        image: dareyregistry/my-nginx:1.0
        ports:
        - containerPort: 80

```

![6. Deployment](./IMG/6.%20Deployment.png)
The provided YAML snippet defines a Kubernetes Deployment for deploying an instance of the Nginx web server. Let's break down the key components:

**apiVersion YAML/vi:** Specifies the Kubernetes API version for the object being created, in this case, a Deployment in the "apps" group.

**kind: Deployment:** Defines the type of Kubernetes resource being created, which is a Deployment. Deployment are used to manage the deployment and scaling of applications.

**metedata:** Contains metedats for Deployment, including the name of the Deployment, which is set to "my-nginx-deployment."

**spec:** Describe the desired state of the Deployment.

**replicas: 1:** Specifies that the desired number of replicas (instances) of the Pods controlled by this Deployment is 1.

**selector:** Defines how the Deployment selects which Pods to manage. In this case. it uses the label "app:my-nginx" to match Pods.

**templete:** Specfies the templete for creating new Pods.

**metedata:** Contains label for the Pods, and in this case, the label is set to "app: my-nginx".

**spec:** Describe the Pods specification.

**containers:** Defines the containers within the Pod.

**name:** my-nginx: Sets the name of the container to "my-nginx".

**image: dareyregistry/my-nginx:1.0:** Specifies the Docker images to be used for the Nginx container. The container. The image is "ridwanaz/my-nginx" with version "1.0".

**ports:** Specifies the port mapping for the conntainer, and in this case, it expose port 80.

3. Create a new file which I called `nginx-service.yaml` and paste the content below.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nginx-service
spec:
  selector:
    app: my-nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort

```

![8. Nginx Service](./IMG/8.%20Nginx%20Service.png)

The provided YAML snippet defines a Kubernetes Service for exposing the Nginx application to the external world. Let's break down the key components:

**apiVersion: v1:** Specifies the Kubernetes API version for the object being created, in this case, a Service.

**kind: Service:** Define the type of Kubernetes resource being created, which is a Service. Service provide n a stable endpoint for accessing a set of Pods.

**metedata:** Contains metedata for the Service, including the name of the Service, which is set to "my-nginc-service".

**spec:** Describe the desired state of the Service.

**selector:** Specifies the labels used to select which Pods the Service will route traffic to. In this case, it selects Pods with the label "app: my-nginx".

**ports:** Specifies the ports configuration for the Service.

**protocol: TCP:** Specifies the transport layer protocol, which is TCP in this case.

**port: 80:** Defines the port on which the Service will exposed.

**tergetPort: 80:** Specifies the port on the Pods to which the traffic will be forwarded.

**type: NodePort:** Sets the type of the Service to NodePort. This means that the Service will be accessiblr externally on each Node's IP address at a static port, which will be automatically assigned unless specified.

4. After defining both my deployment and service YAML file then I run the command below.

```bash
kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-service.yaml
```

5. Verify the deployment

```bash
kubectl get deployments

kubectl get services
```

![9. Kubernetes Deployment](./IMG/9.%20Kubernetes%20Deployment.png)

6. Then I access my deployment on the web browser.

```bash
minikube service my-nginx-service --url
```

Then I copied the url provided above, and follow the above steps for tunnelling.
![10. Minikube URL](./IMG/10.%20Minikube%20URL.png)
![11. Deployement Putty](./IMG/11.%20Deployement%20Putty.png)

7. Then I open my web browser and input this URL `http://127.0.0.1:32446`.
![12. Welcome Page](./IMG/12.%20Welcome%20Page.png)
