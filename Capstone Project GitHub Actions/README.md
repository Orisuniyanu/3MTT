# Capstone Project: E-Commerce Application CI/CD Pipeline

## Project Overview: Automated Pipeline for an E-Commerce Platform

## Hypothetical use Case:
I am tasked with developing and maintaining an e-commerce platform. This platform has two primary components:
- **E-Commerce API:** Backend service handling product listings, user accounts, and order processing.
- **E-Commerce Frontend:** A web application for userd to browse products, manage their accounts, and place orders.

The goals is to automate the integration and deployment process for both components using GitHub Actions, ensuring continuous delivery and integration.

## Task 1: Project Setup (GitHub Account)
1. I login to my GitHub Account and click on **Repository** then click on **New** to create a new remote repository.
![1. New Repository](./IMG/1.%20New%20Repository.png)

2. Then I name the new repository **ecommerce-platform** and I make sure to make it public, then click on **Create repository**.
![2. Ecommerce-Platform](./IMG/2.%20Ecommerce-Platform.png)
3. Then I open my Ubuntu VM terminal locally, then create two new directory which I name **api** for backend and **webapp** for frontend.
```bash
mkdir api backend
```
![3. Make Directories](./IMG/3.%20Make%20Directories.png)
![10. Rename](./IMG/10.%20Rename.png)

## Task 2: Initialize GitHub Actions
1. After that I initia my project repository so that Git can start tracking all my files.
```bash
git init
```
2. Then I create another file which is the pipeline file that GitHuv Actions will use for it jobs.
```bash
mkdir -p .github/workflows
```
![4. Local Pipeline](./IMG/4.%20Local%20Pipeline.png)
![5. Tree](./IMG/5.%20Tree.png)

## Task 3: Backend API Setup (Node.js/Express)
1. Then I navigate into the **api** directory, the run the following command.
```bash
cd api
```
2. Then I check if node and npm is already installed on my environment.
```bash
node -v
npm -v
```
![Node Version](./IMG/6.%20Node%20Version.png)
3. Then I install node, express and the other software I need for this project.
```bash
npm init -y
npm install express
npm install --save-dev jest supertest
```
![7. NPM Initialized](./IMG/7.%20NPM%20Initialized.png)
4. Then create another file which is **server.js** this will serve the content of the e-commerce webpage.
```js
vi server.js

# Below is the content inside the file

const express = require('express');
const app = express();
app.use(express.json());

let products = [
  { id: 1, name: 'Laptop', price: 999 },
];

app.get('/products', (req, res) => {
  res.json(products);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
```
5. Then I also create another file this time it's **api.test.js** inside **api/__tests__/**.
```js
mkdir __tests__ && cd __tests__
vi api.test.js
# Below is the content inside the file

const request = require('supertest');
const app = require('../index');

test('GET /products returns product list', async () => {
  const res = await request(app).get('/products');
  expect(res.statusCode).toBe(200);
  expect(res.body.length).toBeGreaterThan(0);
});
```
![8. Json Content](./IMG/8.%20Json%20Content.png)
6. Then I edit my **package.json** file and change the **test** to **jest**.
```bash
vi package.jsom
```
![9. Package File](./IMG/9.%20Package%20File.png)

## Task 4: Frontend Web Application Setup (React)
1. Now I step out of the **api** and navigate to the second directory which is **webapp**.
```bash
cd ..
cd webapp
```
2. Now I create a new React application in the current directory.
```bash
npx create-react-app webapp
```
This command above will installs React, Webpack, Babel, and other dependencies automatically.
![11. React App](./IMG/11.%20React%20App.png)
Showing all the file installed in the webapp
![12. Webapp Tree](./IMG/12.%20Webapp%20Tree.png)
3. Then still inside the **webapp** directory I navigate to **src** directory.
```bash
cd src
vi api.js
```
4. Then I place the following content inside the **api.js** file.
```js
# Below is the content inside the file
// webapp/src/api.js
import axios from 'axios';

const apiClient = axios.create({
  baseURL: process.env.REACT_APP_API_URL || 'http://localhost:3000',
});

export default apiClient;
```
![13. API File](./IMG/13.%20API%20File.png)

## Task 5: Continuous Integration Workflow

1. Then I move to my GitHub Actions pipeline directory, **.github/workflows**
```bash
cd .github/workflows/
```
2. Then I start creating different file for automate testing and building for both backend and frontend
3. I create the first pipeline file for backend, which I name **backend-ci.yml**.
```bash
vi backend.yml

# Below file is the content inside the file
name: Backend CI

on:
  push:
    paths:
      - 'api/**'
  pull_request:
    paths:
      - 'api/**'

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: api
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm test
```
4. Then also create the frontend pipeline file, which I name **frontend.yml**.
```bash
vi frontend.yml

# Below file is the content inside the file
name: Frontend CI

on:
  push:
    paths:
      - 'webapp/**'
  pull_request:
    paths:
      - 'webapp/**'

jobs:
  build:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: webapp
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run build
```
![14. Pipeline Tree](./IMG/14.%20Pipeline%20Tree.png)

## Task 6: Docker Integration
**Goal:** Containerize backend and frontend apps.
1. Then I navigate to **api** and create the Dockerfile for the backend.
```bash
cd api
vi Dockerfile
# Below is the content in the file

FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["node", "index.js"]
```
2. I also perform the same process for frontend, I navigate to **webapp** and create Dockerfile for frontend.
```bash
cd ..
cd webapp
vi Dockerfile

# Below is the content in the file

FROM node:18 as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```
![15. Dockerfile](./IMG/15.%20Dockerfile.png)
3. Then I update my backend pipeline file to include docker build
```bash
cd .github/workflows
ls
vi backend.yml

# Below is the update content I add

- name: Build Docker Image
    run: docker build -t orisuniyanu/ecommerce-api ./api
```
4. I also perform the same update for frontend pipeline
```bash
vi frontend.yml

# Below is the update content I add

 - name: Build Docker Image
    run: docker build -t myuser/ecommerce-webapp ./webapp
```

## Task 7: Deploy to Cloud
For the cloud provider I choose AWS.
1. I login to my AWS Account and copy my public Ip for SSH connection on port 22.
![16. Public Ip](./IMG/16.%20Public%20Ip.png)
2. Then I open my Putty application and initialize the SSH connection through putty.
![17. Putty Connection](./IMG/17.%20Putty%20Connection.png)
3. Then I create ssh-key where I copy the private key to my GitHub Secret.
![18. SSH](./IMG/18.%20SSH.png)
4. Then I go back to my GitHub and select the repository I am working on, then click on **settings**.
![19. Repo Setting](./IMG/19.%20Repo%20Setting.png)
5. Then scroll down and click on **Secrets and variables** then select **Actions**.
![20. Settings Actions](./IMG/20.%20Settings%20Actions.png)
6. After that I click on **New repository secret**.
![21. New Repository Secret](./IMG/21.%20New%20Repository%20Secret.png)
7. Then Copy my private key and paste it in the space provided, and name it **AWS_SECRET_ACCESS_KEY**.
![22. Private Key](./IMG/22.%20Private%20Key.png)
8. Then go my AWS EC2 instance and paste the public SSH key to the **authorized_keys**
```bash
cat >> authorized_keys
```
![23. Public Key](./IMG/23.%20Public%20Key.png)
9. Then I also create another secret on the GitHub which I name **AWS_ACCESS_KEY_ID**

## Task 9: Performance & Security
1. Then I edit my both frontend and backend pipeline where I include the following content in them to enhance security.
```yaml
- name: Cache Node Modules
  uses: actions/cache@v3
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-
```
2. After all the steps I push my local repository to GitHub repository.
```bash
git add .
git commit -m "first commit"
git remote add origin git@github.com:Orisuniyanu/ecommerce-platform.git
git push -u origin main
```
3. Then both pipeline for backend and frontend are successful.
![24. Pipeline Successful](./IMG/24.%20Pipeline%20Successful.png)

## Task 10: Push to DockerHub
1. After this I update both my pipeline to be able to push my built image to DockerHub.
2. Then I navigate to **.github/workflows/ and vi into the backend.yml file to add the following content.
```bash
cd .github/workflows
vi backend.yml

# The following is the updated content
      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
      - name: Push Docker Image
        run: docker push orisuniyanu/ecommerce-api
```
3. Then I perform the same for frontend.yml file 
```bash
vi frontend.yml

# The following is the updated content
      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
      - name: Push Docker Image
        run: docker push orisuniyanu/ecommerce-api
```
![25. DockerHub Pipeline](./IMG/25.%20DockerHub%20Pipeline.png)
4. After that I went back to my GitHub repository then click on **Settings**, then click on **Secrets and variables** after that **Actions**.
![26. DockerHub Secrets](./IMG/26.%20DockerHub%20Secrets.png)
5. Then Click on **New repository secret** and I name the new secret **DOCKER_USERNAME** and the secret is **orisuniyanu** after that I click on **Add secret**.
![27. DOCKER_USERNAME](./IMG/27.%20DOCKER_USERNAME.png)
6. Then same process for my DockerHub Password.
![28. DockerHub Password](./IMG/28.%20DockerHub%20Password.png)
7. After that I make some little changes to both the **api** and **webapp** directory to able to trigger the Actions.
8. The push the new update to GitHub.
```bash
git add .
git commit -m "Update Actions Pipeline for DockerHub1"
git push
```
9. Then the actions is successful.
![29. DockerHub Pipeline](./IMG/29.%20DockerHub%20Pipeline.png)

## Task 11: Deployment to AWS EC2 Instance

1. Then I continue with my deployment by deploying to my AWS EC2 instance to the end user accessment of the webpage.
2. Then I login to my AWS console account then copied my public IP address.
![30. EC2 Public IP](./IMG/30.%20EC2%20Public%20IP.png)
3. Then I paste my public IP to my putty application, so with that I was able to access my EC2 instance.
![31. EC2 Instance](./IMG/31.%20EC2%20Instance.png)
4. Then I check if I have Docker installed on my EC2 instance
```bash
docker version
```
![32. Docker Version](./IMG/32.%20Docker%20Version.png)
5. Then I update my pipeline for both backend.yml and frontend.yml in **.github/workflows**

**backend.yml**
```bash
      - name: Deploy to EC2
        uses: appleboy/ssh-action@v0.1.10
        with:
          host: ${{ secrets.AWS_HOST }}
          username: ${{ secrets.AWS_ACCESS_KEY_ID }}
          key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          script: |
            docker pull orisuniyanu/ecommerce-api
            docker stop ecommerce-api || true
            docker rm ecommerce-api || true
            docker run -d -p 3000:3000 --name ecommerce-api orisuniyanu/ecommerce-api
```
**frontend.yml**
```bash
      - name: Deploy to EC2
        uses: appleboy/ssh-action@v0.1.10
        with:
          host: ${{ secrets.AWS_HOST }}
          username: ${{ secrets.AWS_ACCESS_KEY_ID }}
          key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          script: |
            docker pull orisuniyanu/ecommerce-webapp
            docker stop ecommerce-webapp || true
            docker rm ecommerce-webapp || true
            docker run -d -p 80:80 --name ecommerce-webapp orisuniyanu/ecommerce-webapp
```
![33. Complete Pipeline](./IMG/33.%20Complete%20Pipeline.png)
6. Then I went back to my GitHub repository and click on setting, then **Secrets and variables**, then **actions**.
![34. Secrets And Variables](./IMG/34.%20Secrets%20And%20Variables.png)
7. Then click on **New repository secret** and add my EC2 public IP address, which I named **AWS_HOST**.
![35. AWS_HOST](./IMG/35.%20AWS_HOST.png)

8. Then I just add some comment to my Dockerfile for both the frontend and backend to be able to trigger the GitHub Actions.
9. After that I push it to my GitHub repository.
```bash
git add .
git commit -m "Complete Pipeline4"
git push
```

## Task 12: Docker Compose
Instead of me having different pipeline file for both frontend and backend pipeline I decide to go with docker compose with this I can be able to define the internal network that will communicate with both the frontend app and backend app.

1. Then at the root level of my local repository I create a new file which I call **docker-compose.yml**
then place following content in it.
```bash
vi docker-compose.yml

#The following is the content inside the file

version: '3.8'

services:
  api:
    build:
      context: ./api
    container_name: ecommerce-api
    ports:
      - "3000:3000"
    volumes:
      - api-data:/app/data   # This will persist files written to /app/data
    networks:
      - ecommerce-net
    environment:
      - NODE_ENV=production

  webapp:
    build:
      context: ./webapp
      args:
        REACT_APP_API_URL: http://api:3000
    container_name: ecommerce-webapp
    ports:
      - "80:80"
    depends_on:
      - api
    networks:
      - ecommerce-net

volumes:
  api-data:  # named volume

networks:
  ecommerce-net:
```
2. Then update I create a different file called **fullstack.yml**
```bash
vi fullstack.yml

#Then I place the following content

name: Fullstack CI/CD

on:
  push:
    paths:
      - 'api/**'
      - 'webapp/**'
      - 'cloud/docker-compose.yml'
  pull_request:
    paths:
      - 'api/**'
      - 'webapp/**'
      - 'cloud/docker-compose.yml'

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Node.js for API Tests
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install and test API
        working-directory: api
        run: |
          npm ci
          npm test

      - name: Install and test Frontend
        working-directory: webapp
        run: |
          npm ci
          npm run test -- --watchAll=false

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build and push API image
        run: |
          docker build -t orisuniyanu/ecommerce-api ./api
          docker push orisuniyanu/ecommerce-api

      - name: Build and push Webapp image
        run: |
          docker build -t orisuniyanu/ecommerce-webapp ./webapp
          docker push orisuniyanu/ecommerce-webapp

      - name: Deploy to EC2 via SSH
        uses: appleboy/ssh-action@v0.1.10
        with:
          host: ${{ secrets.AWS_HOST }}
          username: ${{ secrets.AWS_USERNAME }}
          key: ${{ secrets.AWS_SSH_PRIVATE_KEY }}
          script: |
            cd ~
            if [ ! -d "cloud" ]; then
              git clone https://github.com/Orisuniyanu/ecommerce-platform.git cloud
            else
              cd cloud
              git pull origin main
            fi
            cd cloud
            docker pull orisuniyanu/ecommerce-api
            docker pull orisuniyanu/ecommerce-webapp
            docker compose -f docker-compose.yml down
            docker compose -f docker-compose.yml up -d
```
3. Then I push to Github
```bash
git add .
git commit -m"Modify _test_ file"
git push
```
4. And the pipeline is successful.
![36. Pipeline Successful](./IMG/36.%20Pipeline%20Successful.png)
5. I login to my EC2 instance and check my images, running container and the network I creat.
```bash
docker images # To list all the static images I have on my local environment (docker)
docker ps # All the running container
docker ps -a # All the running container and the the containers that has existed
docker network ls # To list all the network I have define and avaliable
6. Here is my interface.
![37. Frontend](./IMG/37.%20Frontend.png)
7. Here is my backend interface.
![38. Backend](./IMG/38.%20Backend.png)
8. Here is my docker environment.
![39. Dockers](./IMG/39.%20Dockers.png)
9. And the pipeline also push my images to my DockerHub.
![40. DockerHub](./IMG/40.%20DockerHub.png)

# Thanks

