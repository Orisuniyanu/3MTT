# Implementing Continuous Integration with GitHub Actions

This is the Module 3 of this course GitHub Actions, focused on Implementing Continuous Integration. In this module, i will delve into more advanced aspects of GitHub Actions. Learning how to configure build matrices for testing across multiple environment and integration essential experienced ccder looking to streamline your workflow, this modele is designed to enhance my skills in automating the quality of my software development process.

## Why Continuous Integration is Essentail

Imagine you're building a complex puzzle. Each piece represents a part of your code - a feature, a bug fix, or a new functionality. In the absence of continuous integration, adding a new piece to the puzzle is like working in the dark. You hope it fits perfectly without affecting the existing pieces, but you can't be sure until the entire puzzle is complete. This approach is time-consuming and prone to errors. 

Now, imagine having a system that illuminates each new piece as you add it, instantly showing you how it fits with the existing ones. This is what continuous integration does for software development. It allows you to integrate changes frequently and detect issues early, ensuring that each 'piece' of your code seamlessly integrates with the existing 'puzzle' without disruptions. By mastering continuous integration with GitHub Actions, you are not just learning to code; you are learning to build your software puzzle efficiently, piece by piece, ensuring quality and cohesion at every step.

## Pre-requisites

1. **Proficiency in YAML:**
- Basic understanding of YAML and structure.
- Familiarity with writing and interpreing YAML files, as GItHub Actions workflows are defined in YAML.

2. **Experience with GitHub and GitHub Actions:**
- Basic knowledge of how to use GitHub, including creating repository and push code.
- A foundational understanding of GitHub Actions and how they work.

3. **Understanding of Node.js and npm:**
- Experience with Node.js, as the project examples are based on Node.js environments.
- Familiarity with npm (Node Package Manager) for managing Node.js project dependencies.

4. **Familiarity with Software Testing Concepts:**
- Basic knowledge of software testing principles.
- Understanding of automated testing and its role in CI/CD.

5. **Knowledge of Code Quality Tools:**
- Familiarity with static code analysis anf linting tools, especially ESLint for JavaScript.
- Resource: [ESLint - Pluggable JavaScript Linter.](https://eslint.org/)

6. **Access to a Development Environment:**
- A computer with Git, Node.js, and text editor or IDE installed.
- Internet access to clone the project repository and perform tasks online.

## **Lesson 2: Configuring Build Matrices**

## **Objectives:**
- Implement matrix builds to test across multiple version of environments.
- Manage build dependencies efficiently.

## **Detailed Steps and Code Explanation:**
1. **Parallel and Matrix Builds:**
- A matrix build allows you to run jibs across mulyiple environments and versions simultaneously, increasing efficiency.
- This is useful for testing the application in different version of runtime environment or dependencies.
```bash
strategy:
  matrix:
    node-version: [12.x, 14.x, 16.x]
    # This matrix will run the job multiple times, once for each specified Node.js version (12.x, 14.x, 16.x).
    # The job will be executed separately for each version, ensuring compatibility across these versions.
```

2. **Managing Buils Dependencies:**
- Handling dependencies and services required for build process is crucial.
- Utilize caching to reduce the time spent on downloading and installing dependencies repeatedly.
```bash
- name: Cache Node Modules
  uses: actions/cache@v2
  with:
    path: ~/.npm
    key: ${{" runner.os "}}-node-${{" hashFiles('**/package-lock.json') "}}
    restore-keys: |
      ${{" runner.os "}}-node-
  # This snippet caches the installed node modules based on the hash of the 'package-lock.json' file.
  # It helps in speeding up the installation process by reusing the cached modules when the 'package-lock.json' file hasn't changed.
```

## **Lesson 3: Integrating Code Quality Checks**
## **Ojectives:**
- Integrate code analysis tools into the GitHub Actions workflow.
- Configure linters and static code analyzers for maintaining code quality.

## Detailed Steps and Code Explanation:
1. **Adding Code Analysis Tools:**
- Include steps in your workflow to run tools that analyze code quality and adherence to coding standards.
```bash
- name: Run Linter
  run: npx eslint .
  # 'npx eslint .' runs the ESLint tool on all the files in your repository.
  # ESLint is a static code analysis tool used to identify problematic patterns in JavaScript code.
```
2. **Configuring Linters and Static Code Analyzers:**
- Ensure your repository includes configuration files for these tools, such as **.eslintrc** for ESLint.
```bash
# Ensure to include a .eslintrc file in your repository
# This file configures the rules for ESLint, specifying what should be checked.
# Example .eslintrc content:
# {"\n   #   \"extends\": \"eslint:recommended\",\n   #   \"rules\": {\n   #     // additional, custom rules here\n   #   "}
# }
```

## Steps:

1. I open a new folder on my Ubuntu Linux environment and add the following directories and files.
```bash
mkdir GitActions
mkdir -p .github/workflows # For GitHub Actions workflows
cd .github/workflows
vi node.js.yaml
```
![1. Tree](./IMG/1.%20Tree.png)

2. Then I also create ESLint Configuration which is **.eslintrc.json**
```bash
vi .eslintrc.json
# Then add the following script

{
  "extends": "eslint:recommended",
  "env": {
    "node": true,
    "es6": true
  },
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "single"]
  }
}
```
![2. ESLintrc](./IMG/2.%20ESLintrc.png)
3. Go into your .github/workflows/ directory and open the file
```bash
vi .github/workflows/node.js.yml

# Then add the following script

name: Node.js CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [12.x, 14.x, 16.x]

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node-version }}

      - name: Cache Node Modules
        uses: actions/cache@v2
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.os }}-node-

      - name: Install Dependencies
        run: npm ci

      - name: Run Linter
        run: npx eslint .
```
![3. WorkFlows](./IMG/3.%20WorkFlows.png)

4. After doing all that I even add some script to my package.json like "lint" under script, I push to my Github repository
```bash
git add .
git commit -m "Integration"
git push
```
![4. Git Pushed](./IMG/4.%20Git%20Pushed.png)
![5. GitHub](./IMG/5.%20GitHub.png)
5. Then I click on **Actions**.
![6. Works](./IMG/6.%20Works.png)
