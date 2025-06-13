# GitHub Actions and CI/CD Course: Deployment Pipelines and Cloud Platforms

## Introdction to GitHub Actions Course: Deployment and Cloud Integration
This project focus on deployment pipelines and platform integration. In this project I am going to explore how we can leverage GitHub Actions to automate our deployment processes, effectively pushing our applications to various cloud environments. Whether we are budding developer, a seasoned engineer, or anyone interested in the world of DevOps, this course is tailored to provide me with practical skills and insights into the world of continuous integration, continuous deployment, and cloud services.

## The Relevance of This Course
![1. Relevance](./IMG/1.%20Relevance.png)

Imagine you're a pilot of a modern airliner a complex machine with numerous systems and components that need to work in perfect harmony. In this analogy, your codebase is the airliner, while GitHub Actions represents the sophisticated control systems that manage the aircraft's operations. Each commit, merge, or push you make is akin to adjusting the flight controls, ensuring that the aircraft navigates smoothly and efficiently to its destination - which, in our case, is the successful deployment of your application. 

Deploying applications to the cloud without automation is like flying a plane manually without any advanced navigation systems - it's possible, but prone to errors, inefficiencies, and immense stress. GitHub Actions provides the automation - the autopilot, if you will ensuring that your deployment processes are as smooth, error-free, and efficient as possible. Through this course, you will learn not just to 'fly the plane', but to engage and trust your autopilot, enabling you to manage your applications' journey from development to production with confidence and precision.

## Pre-requisites

1. **GitHub Account:**
- Necessary for managing repositories and setting up GitHub Actions.
- I already have a [GitHub Account.](https://github.com/Orisuniyanu)
![2. GitHub Account](./IMG/2.%20GitHub%20Account.png)

2. **Basic knowledge of Git:**
- Understanding of Git for version control.
- Installtion guild: [Git Installation.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Basic tutorial: [Git Basics.](https://git-scm.com/docs/gittutorial)
![3. Git Bash](./IMG/3.%20Git%20Bash.png)

3. **Familiarity with YAML:**
- Understanding YAML syntax for writing GitHub Actions workflows.
- Quick guild: [Learn YAML.](https://learnxinyminutes.com/yaml/)

4. **Experience with Cloud Platforms (AWS, Azure, or GCP):**
- Basic knowledge of the chosen cloud platform for deployment.
- AWS: [AWS Getting Started.](https://aws.amazon.com/getting-started/)
- Azure: [Azure Documentation.](https://learn.microsoft.com/en-us/azure/)
- Google Cloud: [Google Cloud Documentation.](https://cloud.google.com/docs)

5. **Understanding of CI/CD Concepts:**
- Familiarity with Continuous Integration and Continuous Deployment processes.
- Resource: [CI/CD Introdction](https://www.redhat.com/en/topics/devops/what-is-ci-cd)

6. **Node.js and npm Installed (for Node.js projects)**
- Knowledge of Node.js for running JavaScript server-side.
- Node.js: [Download and Installation.](https://nodejs.org/en/download/)
- Verify installation: 
```bash
node -v 
npm -v
```
![4. Node Version](./IMG/4.%20Node%20Version.png)

7. **Access to a Code Editor or IDE:**
- A text editor or Integrated Development Environment (IDE) like Visual Studio Code, Atom, or Sublime Text.
- Visual Studio Code: [Download VS Code.](https://code.visualstudio.com/Download)
![5. VS Code](./IMG/5.%20VS%20Code.png)

8. **Basic Knowledge of Software Deployment:**
- Understanding the basics of deployinh applications, especaially in a clous environment.
- Resource: [Introdcution to Software Deployment.](https://www.ibm.com/topics)

## Lesson 1: Introdction to Deployment Pipelines

## Objectives:
- Define and understand the stage of a deployment pipeline.
- Learn about different deployment strategies.

### Lesson Details:
1. **Defining Deployment Stages:**
- **Development:** Writing and testing code in a local environment.
- **Integration:** Merging code changes to a shared branch.
- **Testing:** Running automated tests to ensure code quality.
- **Staging:** Deploying code to a production-like environment for final testing.
- **Production:** Releasing the final version of code to the end-users.

2. **Understanding Deployment Strategies:**
- **Blue-Green Deployment:** Running two production environments, only one of which servers end-users at any time.
- **Canary Release:** Rolling out changes a small subnet of users before full deployment.
- **Rolling Deployment:** Gradually replacing instances of the previous version of an application with the new version.

## Lesson 2: Automated Release and Versioning

## Objectives:
- Automate versioning in the CI/CD process.
- Create and manage software releases.

# Automating Versioning in CI/CD:
1. **Semantic Versioning:**
- Use semantic versioning (SemVer) for your software. It used a three-part version number, for example, **MAJOR.MINOR.PATCH**. 
- Resource: [Semantic Versioning.](https://semver.org/)

2. **Automated Versioning with GitHub Actions:**
- Implement automated versioning using GitHub Actions to increment version numbers automatically based on code changes.

**Example snippet for a versioning script in GitHub Actions:**
```bash
name: Bump version and tag
on:
  push:
    branches:
      - main

jobs:
  build:
    name: Create Tag
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
        # The checkout action checks out your repository under $GITHUB_WORKSPACE, so your workflow can access it.

      - name: Bump version and push tag
        uses: anothrNick/github-tag-action@1.26.0
        env:
          GITHUB_TOKEN: ${{" secrets.GITHUB_TOKEN "}}
          DEFAULT_BUMP: patch
        # This action automatically increments the patch version and tags the commit.
        # 'DEFAULT_BUMP' specifies the type of version bump (major, minor, patch).
```
- This action will automatically increment the patch version and create a new tag each time changes are pushed to the main branch.

## Creating and Managing Releases:
1. **Automating Release with GitHub Actions:**
- Set up GitHub Actions Create a new release whenever a new tag is pushed to the repository.

**Example snippet to create a release:**
```bash
on:
  push:
    tags:
      - '*'

jobs:
  build:
    name: Create Release
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
        # Checks out the code in the tag that triggered the workflow.

      - name: Create Release
        id: create_release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{" secrets.GITHUB_TOKEN "}}
        with:
          tag_name: ${{" github.ref "}}
          release_name: Release ${{" github.ref "}}
          # This step creates a new release in GitHub using the tag name.
```
- The **actions/create-release@v1** action is used to create a release on GitHub. It uses the tag that triggered the workflow to name and label the release.

## Troubleshooting and Additional Resources:

- For troubleshooting GitHub Actions, the [GitHub Actions Documentation](https://docs.github.com/en/actions) is an invaluable resource.
- To resolve issues related to specific actions used in your workflow, refer tp their respective repositories on GitHub or their documentation.
- For general questions and community support, the [GitHub Community Forum](https://github.com/orgs/community/discussions/) can be a great place to seek help.
- Remember, reading through the logs generate by GitHub Actions can provides insight into what might be going wrong with your workflows.

## Lesson 3: Deploying to Cloud Platforms

### Objectives:
- Deploy applications to popular cloud platform using GitHub Actions.
- Configure deployment environments.

## Lesson Details:
**Detailed Guild: Deploying Applications to Cloud Platform with GitHub Actions**

For begineers completely new to GitHub Actions and clouf deployement, it's essentail to understand the process step-by-step. Here's a detailed breakdown of feploying applications to cloud platform like AWS, Azure, or Google Cloud Platform using GitHub Actions:

## Step 1: Choose a Cloud Platform

Decide on a cloud platform based on your project requirements. Each platform (AWS, Azure, Google Cloud) has its own set of services and pricing models.

- AWS: [Amazon Web Service](https://aws.amazon.com/)
- Azure: [Microsoft Azure](https://azure.microsoft.com/)
- Google Cloud Platform: [GCP](https://cloud.google.com/)

## Step 2: Set Up GitHub Actions for Deployment

1. **Create the Workflow File:**
- Workflow files are YAML files stored in the repository's **.github/workflows** directory.
- Start by creating a file, e.g., **deploy-to-aws.yml** in this directory.

2. **Defining the Workflow:**
- A workflow is defined with a series of steps that run on specified events.

**Example for AWS Deployment:**
```bash
name: Deploy to AWS
on:
  push:
    branches:
      - main
  # This workflow triggers on a push to the 'main' branch.

jobs:
  deploy:
    runs-on: ubuntu-latest
    # Specifies the runner environment.

    steps:
    - name: Checkout code
      uses: actions/checkout@v2
      # Checks out your repository under $GITHUB_WORKSPACE.

    - name: Set up AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{" secrets.AWS_ACCESS_KEY_ID "}}
        aws-secret-access-key: ${{" secrets.AWS_SECRET_ACCESS_KEY "}}
        aws-region: us-west-2
      # Configures AWS credentials from GitHub secrets.

    - name: Deploy to AWS
      run: |
        # Add your deployment script here.
        # For example, using AWS CLI commands to deploy.
```

- This workflow deploys your application to AWS when changes are pushed to the main branch.

## Step 3: Configuring Deployment Environments 

1. **Setting Up Environment Variables and Secrets:**
- Store sensitive information like API keys and access token as [GitHub Secrets.](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- Use environment variables for non-sensitive configuration.
2. **Environment-Specific Workflow:**
- Tailor your workflow for different environments (development, staging, production) by using conditions or different workflow files.

## Additional Resources:
- **GitHub Actions Documentation:** For a comprehensive understanding, refer to the [official documentation.](https://docs.github.com/en/actions)
- **AWS GitHub Actions:** Learn more about the [AWS Actions available on GitHub.](https://github.com/aws-actions)
- **Azure GitHub Actions:** Check out [Azure Actions.](https://github.com/Azure/actions)
- **Google Cloud GitHub Actions:** Explore [Google Cloud Actions.](https://github.com/google-github-actions)

## Troubleshooting:
- Review actions logs in GitHub for errors during execution.
- Ensure that your cloud platform credentials are correctly set up in GitHub Secrets.
- validate your YAML synatx errors using online validators like [YAML Lint.](https://www.yamllint.com/)

## Practical

## Step 1: GitHub Setup

1. I login to my GitHub account and create a new repository which I name **GitCloud**.
![6. GitHub Repo](./IMG/6.%20GitHub%20Repo.png)
2. Then move to my Local Environment and also open an new directory for this project which I named **cloud**
![7. Local Environment](./IMG/7.%20Git%20Bash.png)
3. Then I Create a simple test in **tests/app.test.js**
```bash 
mkdir tests && cd tests

vi app.test.js

# Then add the follwoing script
const request = require('supertest');
const express = require('express');

const app = express();
app.get('/', (req, res) => res.send('Hello from Node.js!'));

test('GET / returns greeting', async () => {
  const res = await request(app).get('/');
  expect(res.statusCode).toBe(200);
  expect(res.text).toBe('Hello from Node.js!');
});
```
![8. Tests](./IMG/8.%20Tests.png)

4. Then I create CI workflow pipeline directory
```bash
mkdir -p .github/workflows && cd .github/workflows
```
5. After that I create a new file for Workflow With Tests + Versioning (Bump).
```bash
vi ci.yml
# Then I add the following script to the file
name: CI & Bump Version

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with: { node-version: '18' }
      - run: npm ci
      - run: npm test
      - name: Bump version & tag
        uses: anothrNick/github-tag-action@1.67.0
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          DEFAULT_BUMP: patch
          WITH_V: true
```
![9. CI.YAML](./IMG/9.%20CIYAML.png)

6. Still inside the .github/workflows I create another file name **release.yml**
```bash
vi release.yml
# Then I add the following script to the file
name: Create Release

on:
  push:
    tags: [ 'v*' ]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create GitHub Release
        uses: softprops/action-gh-release@v1
        with:
          tag_name: ${{ github.ref }}
          name: Release ${{ github.ref_name }}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
![10. Release](./IMG/10.%20Release.png)
7. Then I create another 2 file that deploy staging to EC2 instance and main branch to Elastic Beanstalk (EB).
```bash
vi deploy-staging.yml

name: Deploy to Staging

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm ci
      - name: Deploy to EC2 (Staging)
        uses: appleboy/scp-action@master
        with:
          host: ${{ secrets.STAGING_AWS_HOST }}
          username: ${{ secrets.AWS_USER }}
          key: ${{ secrets.AWS_PRIVATE_KEY }}
          source: "."
          target: "/home/ec2-user/my-node-app-staging"
      - name: Restart on EC2
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.STAGING_AWS_HOST }}
          username: ${{ secrets.AWS_USER }}
          key: ${{ secrets.AWS_PRIVATE_KEY }}
          script: |
            cd /home/ec2-user/my-node-app-staging
            npm install
            pm2 stop my-node-app || true
            pm2 start ecosystem.config.js
            pm2 save
```
```bash
vi deploy-prod.yml

name: Deploy to Production (EB)

on:
  push:
    tags: [ 'v*' ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with: { node-version: '18' }
      - run: npm ci
      - name: Zip for EB
        run: zip -r my-node-app.zip .
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-west-2
      - name: Deploy to Elastic Beanstalk
        run: |
          aws elasticbeanstalk create-application-version \
            --application-name my-node-app \
            --version-label ${{ github.ref_name }} \
            --source-bundle S3Bucket=${{ secrets.EB_S3_BUCKET }},S3Key=my-node-app-${{ github.ref_name }}.zip
          aws elasticbeanstalk update-environment \
            --environment-name my-node-app-prod \
            --version-label ${{ github.ref_name }}
```
8. Then I went back to the root directory of this directory and create package.json file
```bash
vi package.json

{
  "name": "my-node-app",
  "version": "1.0.0",
  "description": "A simple Node.js app with CI/CD and AWS deployment",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test": "jest"
  },
  "keywords": [],
  "author": "Iyanu",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.2"
  },
  "devDependencies": {
    "jest": "^29.7.0",
    "supertest": "^6.3.3",
    "nodemon": "^3.1.0"
  }
}
```
9. After that I push the local repository to my remote repository using GitHub.
```bash
git init
git add .
git commit -m "First commit"
git remote add origin git@github.com:Orisuniyanu/GitCloud.git
git push -u origin main
```
## Step 2: GitHub Secrets
1. Then on the repository I created for this project I click on **Secrets and variables** then click on **Actions**.
2. Then I click on **New repository secret** under **Repository secret**.
3. Then I paste my ssh key to the provided area which I also give it a name.
![12. Add Secret](./IMG/12.%20Add%20Secret.png)
4. I also add another secret this time is my public IP Address to my EC2 instance. Also same thing for username.
![13. IP.Secret](./IMG/13.%20IP.Secret.png)

## Step 3: EC2 Instance
1. Then I log in to my EC2 instance and instance node, npm and pm2 on it.
```bash
sudo apt update && sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt install -y nodejs
sudo npm install -g pm2
```
2. After installing all the package needed I check if they are all installed properly by checking their version.
```bash
node -v
npm -v
pm2 -v
```
![14. Versions](./IMG/14.%20Versions.png)
3. Then I went back to my GitHub and the pipeline is already running and it is successful.
![15. GitHub Action Successfully](./IMG/15.%20GitHub%20Action%20Successfully.png)
![16. GitHub Action Successfully1](./IMG/16.%20GitHub%20Action%20Successfully1.png)
4. This the deploy-staging.yml is successful.

## Step4: Creating Elastic Beanstalk (EB)
1. Now to make this easily for me I provision EB and S3 Bucket using Terraform.
2. I create a new directory for this which I name **EBANDS3**
3. Then I create a new file which is **main.tf**
```bash
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "eb_bucket" {
  bucket = "my-node-app-deployments"
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = "my-node-app"
  description = "My Node.js App managed by Terraform"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "my-node-app-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.2.1 running Node.js 18"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "NODE_ENV"
    value     = "production"
  }
}
```
