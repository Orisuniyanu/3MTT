# Introduction to Continuous Integration and Continuous Deployment

This project will involve setting up a simple web application (e.g., a Node.js application) and applying CI/CD practice using GitHub Actions. This application will have basic functionality, such as serving a static web page.

## Introduction to GitHub Actions and CI/CD Course Project

This course is designed to provide a hands-on learning experience, guilding me through the essentials of automating software development processes using GitHub Actions. This equip me with the practical skills and knowledge I need to implement these powerful automation techniques in my project.

## Why is This Relevant for Learners?

Imagine you're a chef in a busy restaurant. Every dish you prepare is like a piece of software code. Without a systematic approach, you might end up with orders being mixed up, dishes taking too long to prepare, or worse, the quality of the food being inconsistent. This is where a well-organized kitchen, with clear processes and automation (like having appliances that precisely time and cook parts of the dishes), comes into play. In software development, CI/CD is akin to this efficient kitchen. It ensures that your 'dishes' (software builds) are consistently 'cooked' (built, tested, and deployed) with precision and efficiency. By learning GitHub Actions and CI/CD, I'm essentially learning how to set up and manage my high-tech kitchen in the software world, allowing you to serve 'dishes' faster, with higher quality, and with fewer 'kitchen mishaps' (bugs and deployment issues). 
This course help me understand and implement these practices, making your software development process more efficient and error-free, much like a well-orchestrated kitchen. Whether you're working on personal projects, contributing to open source, or building enterprise-level applications, mastering CI/CD with GitHub Actions will be an invaluable skill in your development toolkit

## Lesson 1: Understanding Continuous Integration and Continuous Deployment

1. **Definition and Benefits of CI/CD**
- Continuous integration (CI) is the practice of merging all developers working copies to a shared mainline several times a day.
- Continuous Deployment (CD) is the process of release software changes to production automatically and reliably.
- **Benefits:** Faster release rate, improved developer productivity, better code quality, and enhanced customer satisfaction.

2. **Overview of the CI/CD Pipeline:**
- **CI Pipeline**: Typically includes steps like version control, code integration, automated testing, and building the application.
- **CD Pipeline**: Involves steps like deploying the application to a staging or production environment, and post-deployment monitoring.
- **Tools:** Version control systems (e.g., Git), CI/CD platforms (e.g., GitHub Actions), testing frameworks, and deployment tools.

## Lesson 2: Introduction to GitHub Actions

### Lesson Details: 
- **GitHub Actions:** A CI/CD platform integrated into GitHub, automating the build, test, and deployment pipelines of your software directly within your GitHub repository. 
- **Documentation Reference:** Explore the GitHub Actions Documentation for in-depth understanding. 
Key Concepts and Terminology: 
1. **Workflow:**
- **Definition:** A configurable automated process made up of one or more jobs. Workflows are defined by a YAML file in your repository. 
- **Example:** A workflow to test and deploy a Node.js application upon a Git push. 
- **Documentation:** Learn more about workflows in the [GitHub Docs on Workflows](https://docs.github.com/en/actions/writing-workflows). 
2. **Event:** 
- **Definition:** A specific activity that triggers a workflow. Events include activities like push, pull request, issue creation, or even a scheduled time.
- **Example:** A push event triggers a workflow that runs tests every time code is pushed to any branch in a repository. 
- **Documentation:** Review different types of events in the [Events that trigger workflows section](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows). 
3. **Job:**
- **Definition:** A set of steps in a workflow that are executed on the same runner. Jobs can run sequentially or in parallel. 
- **Example:** A job that runs tests on your application. 
- **Documentation:** Understand jobs in detail in the [GitHub Docs on Jobs](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does).
4. **Step:** 
- **Definition:** An individual task that can run commands within a job. Steps can run scripts or actions. 
- **Example:** A step in a job to install dependencies (`**npm install**`). 
- **Documentation:** Learn about steps in the [Steps section of GitHub Docs](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#jobsjob_idsteps). 
5. **Action:** 
- **Definition:** Standalone commands combined into steps to create a job. Actions can be written by you or provided by the GitHub community.
- **Example:** Using `actions/checkout to check out your repository code. 
- **Documentation:** Explore GitHub Actions in the [Marketplace](https://github.com/marketplace?type=actions) and learn how to create your own in the [Creating actions](https://docs.github.com/en/actions/sharing-automations) [guide](https://docs.github.com/en/actions/sharing-automations). 
6. **Runner:**
- **Definition:** A server that runs your workflows when they're triggered. Runners can be hosted by GitHub or self-hosted. 
- **Example:** A GitHub-hosted runner that uses Ubuntu. 
- **Documentation:** Delve into runners in the [GitHub Docs on Runners](https://docs.github.com/en/actions/using-github-hosted-runners).

## Additional Resources: 
- **GitHub Learning Lab:** Interactive courses to learn GitHub Actions. Visit [GitHub Learning Lab](https://lab.github.com/courses). 
- **GitHub Actions Quickstart:** For a hands-on introduction, check out the [Quickstart for GitHub Actions](https://docs.github.com/en/actions/writing-workflows/quickstart). 
- **Community Forums:** Engage with the GitHub community for questions and discussions at [GitHub Community Forums](https://github.com/orgs/community/discussions/).

## Practical Implementation

### Setting Up the Project:
1. I log in GitHub account and click on **New** to create a new repository **GitAction**.
![1. New Repo](./IMG/1.%20New%20Repo.png)
2. Then I name the new repository **GitAction**, I make sure is Public then scroll down and click on **Create repository**
![2. GitAction](./IMG/2.%20GitAction.png)
3. I open GitBash to clone the new repository to my local environment.
```bash
git clone https://github.com/Orisuniyanu/GitAction.git
```
![3. GIt Clone](./IMG/3.%20GIt%20Clone.png)

## Steps to Install Node.js
1. I open my server I run the following commands to install Node.js 
```bash
sudo apt-get install -y gcc-c++ make
```
The above command Install Required Tools.
2. Then I Add the NodeSource Repository.
```bash
curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
```
3. Then I Install Node.js
```bash
sudo apt-get install -y nodejs
```
4. Then I Confirm Installation
```bash
node -v
npm -v
```
![4. Node Installed](./IMG/4.%20Node%20Installed.png)
5. Then I initialize a Node.js project
```bash
npm init -y
```
![5. NPM Init](./IMG/5.%20NPM%20Init.png)
6. Then I install Express
```bash
npm install express
```
![6. Install Express](./IMG/6.%20Install%20Express.png)
7. Then I make a new file for Node.js which I name **app.js** and add this command in it.
```bash
vim app.js

// Example: index.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {"\n     res.send('Hello World!');\n   "});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
```
8. Then I create a GitHub Action directory on the same local directory and also move inside the last directory and create a workflow file for the GitHub Action pipeline.
```bash
mkdir -p .github/workflows
cd .github/workflows
vim node.js.yml
```
![8. Workflow](./IMG/8.%20Workflow.png)

## Explanation:

1. **`name`**: This simply names your workflow. It's what appears on GitHub when the workflow is running.

2. **`on`**: This section defines when the workflow is triggered. Here, it's set to activate on push and pull request events to the main branch.

3. **`jobs`**: Jobs are set of steps that execute on the same runner. In this example, there's one job named **`build`**.

4. **`runs-on`**: Defines the type of machine to run the job on. Here, it's using the latest Ubuntu virtual machine.

5. **`strategy.matrix`**: This allows you to run the job on multiple verison of Node.js, ensuring compatibility.

6. **`steps`**: A sequence of tasks executeed as part of the job.

- **`action/checkout@v2`**: Checks out your repository under **`$GITHUB_WORKSPACE`**.
- **`action/setup-node@v1`**: Sets up the Node.js environment.
- **`npm ci`**: installs dependencies defined in **`package-lock.json`**.
- **`package.json`**: If it's present.
- **`npm test`**: Runs specified in **`package.json`**.

This workflow is a basic example for a Node.js project, demostrating how to automate testing across different Node.js version and ensuring that your code integrates and work as expected in a clean environment.

9. Then I push the local repository to my remote repository have create for this project.
```bash
git add .
git commit -m "Fix .gitignore and track necessary files"
git push origin main
```
![9. Git Push](./IMG/9.%20Git%20Push.png)
10. Then went to the GitHub repository and click on **Actions**.
![10. GitHub](./IMG/10.%20GitHub.png)
11. Then I ran through an error which mens that I don't have jest for test install.
![11. Error](./IMG/11.%20Error.png)
12. Then I went back to my terminal and install **jest** and also **supertest** then I update my **package.json** file.
```bash
npm install --save-dev jest supertest
```
![12. Update Package](./IMG/12.%20Update%20Package.png)
13. After that I push to github and click on Action again. Here's the result.
![13. Build Success](./IMG/13.%20Build%20Success.png)


