# Jenkins Freestyle Project

## Jenkins Job
In Jenkins, a job is a unit of work or task that can be executed by the Jenkins automation server.

A Jenkins job represents a task or set of tasks that needs to be performed as part of a build or deployment process. Jobs in Jenkins are created to automate the execution of various steps such as compiling code, running tests, packaging applications, and deploying them to servers. Each Jenkins job is configured with a series of build steps, post-build actions, and other settings that define how thw job should be executed.

## Connecting Jenkins To Source Code Management

1. I log into my GitHub account and click on **New** to create new repository for this project.
![3. GitHub Repo](./IMG/3.%20GitHub%20Repo.png)
2. Then I name it **jenkins-scm**, then make sure it is Public  is selected and also tick the and also make sure the branch is main **Add a README file** box, and click on **Create repository**.
![4. New Repo](./IMG/4.%20New%20Repo.png)
3. And it was created successfully.
![5. Jenkins SCM](./IMG/5.%20Jenkins%20SCM.png)
4. Then click on **Code** then **HTTPS** then I copied the URL to use it in my Jenkins Freestyle pipeline.
![6. HTTPS URL](./IMG/6.%20HTTPS%20URL.png)

## Creating a Freestyle Project

1. From the Jenkins dashboard menu on the left side, click on **New Item**.
![1. New Item](./IMG/1.%20New%20Item.png)
2. Then I name this project **"my-first-job'**, and select **Freestyle project**
![2. FreeStyle Project](./IMG/2.%20FreeStyle%20Project.png)
3. Then on the configuration page I click on **Source Code Management** on the left side, then paste the GitHub repo URL and also change the branch name from master to main then save the configuration.
![7. Source Code](./IMG/7.%20Source%20Code.png)
4. Then I click on **Build now** and it was successful.
![8. Console Output](./IMG/8.%20Console%20Output.png)
![9. Build Now](./IMG/9.%20Build%20Now.png)
This shows that I have successfully connected Jenkins with my GitHub repository (jenkin-scm)

## Configuring Build Trigger

As a engineer, we need to be able to automate things and make our work easier in possible ways. I have connected `**Jenkins**` to `**jenkins-scm**` repo, but I cannot run a new build without clicking on `**Build now**`. To eliminate this, I  need to configure a build trigger to my jenkins job. With this, Jenkins will run a new build anytime a change is made to our GitHub repository.

1. On the Jenkins dashboard I click on the project I am working on which is **my-first-job**, then click on **Configure**.
![10. Configure Again](./IMG/10.%20Configure%20Again.png)
2. Then on the left side I click on **Triggers**, then tick the **GItHub hook trigger for GITScm polling** to enable automatic process with manully clicking on **Build now** then save the new configuration.
![11. Trigger](./IMG/11.%20Trigger.png)
3. Then went back to the GitHub, on the repository I using for this project, I click on **Setting**
![12. GitHub Setting](./IMG/12.%20GitHub%20Setting.png)
4. After I click on **Webhooks** on the left side then click on **Add webhook**.
![13. Webhook](./IMG/13.%20Wehhook.png)
5. Then I fill the following
- **Payload URL** -- http://18.144.40.89:8080/github-webhook/ which is my EC2 instance public ip address and the Jenkins port is configured.
- **Content type** -- application/json
- **Which events would you like to trigger this webhook?** -- Send me everything.
Then I click on **Add webhook**.
![14. WebHook Added](./IMG/14.%20WebHook%20Added.png)
6. Then I went to the GitHub on the jenkins-scm repository I edit README.md file to check if the webhook is working.
![15. Make Change](./IMG/15.%20Make%20Change.png)
7. Then I click on the project which is **my-first-job**. and the change was trigger the it runs automatically.
![16. Webhook Working](./IMG/16.%20Webhook%20Working.png)
![17. Number 3](./IMG/17.%20Number%203.png)

