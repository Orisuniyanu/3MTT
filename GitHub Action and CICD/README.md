# GitHub Actions and CI/CD Course Project - YAML

## Introduction
This project will make me master the art of automating software development processes using one of the most powerful tool available on GitHub. This course is designed to equip me with the essential skills needed to streamline the development workflow, enhance the quality of the code, and significantly reduce the time to deploy new features and fixes.

## Why this course is Relevant

Imagine you are a conductor of an orchestra. Each musician (developer) plays a different instrument (code) and must synchronize perfectly to create harmonious music (software). In this scenario, GitHub Actions and CI/CD processes are like your conductor's baton, helping you to orchestrate the diverse elements of software development. Just as a conductor ensures that each musician enters at the right time and the music flows smoothly, CI/CD coordinates the various stages of development, testing, and deployment, ensuring that the final product is delivered seamlessly and efficiently. This course, therefore, is not just about learning the technicalities of GitHub Actions; it's about learning how to conduct your software development orchestra with skill and precision, leading to a symphony of streamlined processes and high-quality outcomes.

## Pre-requisites

1. **GitHub Account:**
- Necessary for repository management and GitHub Actions
- Which I already have [GitHub Accout (Orisuniyanu)](https://github.com/Orisuniyanu)
![1. GitHub Account](./IMG/1.%20GitHub%20Account.png)
2. **Git Installed:**
- Required for version control and managing code changes.
- Already Installed in my previous project.
![2. GIt Bash](./IMG/2.%20GIt%20Bash.png)
3. **Basic Knowledge of Git:**
- Understanding of basic Git commands like (**clone**, **commit**, **push**, **pull**).
- Tutorial: [Git Basics.](https://git-scm.com/docs/gittutorial)
4. **Node.js and npm Installed:**
- Node.js is the runtime for this project, and npm is the package manager.
- Have already download and installed Node.js in my last project, using this [link](https://nodejs.org/en/download/).
- Verify the installation with **node -v** and **npm -v** in the terminal.
```bash
node -v
npm -v
```
![3. Node Version](./IMG/3.%20Node%20Version.png)
5. **Familiarity with JavaScript:**
- Basic understanding of JavaScript programming.
- Tutorial: [JavaScript Guide.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)
6. **Text Editor or IDE:**
- A code editor such as VIsual Studio Code, Atom, or Sublime Text.
- Visual Studio Code: I have it installed already.
![4. VSCode](./IMG/4.%20VSCode.png)
7. **Access to a Command Line Interface (CLI):**
- Terminal with Command Prompt, PowerShell and Git Bash installed already.
![4. VSCode](./IMG/4.%20VSCode.png)
8. **Basic Understanding of YAML:**
- YAML is used for writing GitHub Actions workflows.
- Tutorial: [Learn YAML](https://learnxinyminutes.com/yaml/).

## Lesson Details:
1. **YAML Syntax for Workflows:**
- YAML is a human-readable data serialization standard used for configuration files.
- Key concepts: indentation, key-value, lists.
- Example snippet:
```bash
name: Example Workflow
on: [push]
```
2. **Workflow Structure and Components:**
- **Workflow File:** Located in `**.github/workflows**` directory. e.g., `**main.yml**`.
- **Jobs:** Define tasks like building, testing, deploying.
- **Steps:** Individual tasks within a job.
- **Actions:** Reusable units of code within steps.

## **Module 3: Implementing Continuous Integration**
## **Lesson 1: Building and Testing Code**

## **Objectives:**
- Set up buils steps in GitHub Actions.
- Run tests as part of the CI process.

## **Setting Up Build Steps:**
1. **Defining the Build Job:** 

- In GitHub Actions workflow file (e.g., **.github/workflows/main.yml**), start by defining a job named **build**.
- This job is reposible for building the code.

```bash
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    # Steps will be defined next
```
I create a new directory and a new file for gitaction workflow
```bash
mkdir .github && cd .github
vi main.yml
```
Then push to GitHub.
![6. GItAction](./IMG/6.%20GItAction.png)


2. **Adding Build Steps:**
- Each steps in the job performs a specific task.
- Here, we add three steps: checking out the code, installing dependencies, and running the build script.

```bash
steps:
- uses: actions/checkout@v2
  # 'actions/checkout@v2' is a pre-made action that checks out your repository under $GITHUB_WORKSPACE, so your workflow can access it.

- name: Install dependencies
  run: npm install
  # 'npm install' installs the dependencies defined in your project's 'package.json' file.

- name: Build
  run: npm run build
  # 'npm run build' runs the build script defined in your 'package.json'. This is typically used for compiling or preparing your code for deployment.
```

## **Running Tests in the Workflow:**
1. **Adding Test Steps:**
- After the build steps, include steps to execute the test scripts.
- This ensures that the code is not only but also passed all the tests.
```bash
- name: Run tests
  run: npm test
  # 'npm test' runs the test script defined in your 'package.json'. It's crucial for ensuring that your code works as expected before deployment.
```
**Notes:**
- The **build** job consist of steps to check out the code, install dependencies, build the code, and run tests.
- The **runs-on: ubuntu-latest** line specifies that the job should run on the latest of Ubuntu provided by GitHub ACtions.
- Using actions like **actions/checkout@v2** helps in leveraging community-maintained actions to simplify common tasks.
- Commands like **npm install**, **npm run build**, and **npm test** are standard Node.js commands used for managing dependencies, building, and testing Node.js applications.

## **Additional YAML Concepts in GitHub Actions**

### **Objectives:**
- Deepen understanding of advanced YAML features used in GitHub Actions.
- Explore the use of environment variables and secrets in workflows.

## **Detailed Environment Variables:**
- Environment variables can be defined at the workflow, job, or step level.
- They allow you to dynamically pass configuration and settings.

```bash
env:
  CUSTOM_VAR: value
  # Define an environment variable 'CUSTOM_VAR' at the workflow level.

jobs:
  example:
    runs-on: ubuntu-latest
    steps:
    - name: Use environment variable
      run: echo $CUSTOM_VAR
      # Access 'CUSTOM_VAR' in a step.
```
2. **Working with Secrets:**
- Secrets are encrypted variables set in the GitHub repository settings.
-Ideal for storing sensitive data like access token, passwords, etc.
```bash
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Use secret
      run: |
        echo "Access Token: ${{" secrets.ACCESS_TOKEN "}}"
        # Use 'ACCESS_TOKEN' secret defined in the repository settings.
```
![5. GitHub Secrets](./IMG/5.%20GitHub%20Secrets.png)

3. **Conditional Execution:**
- Can control when jobs, steps, or workflows run based on conditions.
```bash
jobs:
  conditional-job:
    runs-on: ubuntu-latest
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    # The job runs only for push events to the 'main' branch.
    steps:
    - uses: actions/checkout@v2
```
4. **Using Outputs and Input Between Steps:**
- Share data between steps in a job using outputs.
```bash
jobs:
  example:
    runs-on: ubuntu-latest
    steps:
    - id: step-one
      run: echo "::set-output name=value::$(echo hello)"
      # Set an output named 'value' in 'step-one'.
    - id: step-two
      run: |
        echo "Received value from previous step: ${{" steps.step-one.outputs.value "}}"
        # Access the output of 'step-one' in 'step-two'.
```
**Learner Notes:**
- Environment variables and secrets are crucial for managing configurations and sensitive data in your CI/CD pipelines. 
- Conditional execution helps tailor the workflow based on specific criteria, making your CI/CD process more efficient. 
- Sharing data between steps using outputs and inputs allows for more complex workflows where the output of one step can influence or provide data to subsequent steps. 
- These advanced features enhance the flexibility and security of your GitHub Actions workflows, enabling a more robust CI/CD process

## **Lesson 2: Configuring Build Matrices**
**Objectives:**
- Implement parallel and matrix builds.
- Manage dependencies across different environments.

Then I click on **Actions**
![7. GitAction Run](./IMG/7.%20GitAction%20Run.png)
