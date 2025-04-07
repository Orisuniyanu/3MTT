# Hands-On Git Project: Collaborative Website Development with Git and GitHub

## Introduction
The purpose of this project is to create a step-by-set project to simulate the workflow of Git and GitHub. This hands-on project will involves
1. Installation of Git
2. Setting up a GitHub repository
3. Cloning the repository
4. Creating branches
5. Making changes
6. Merging those changes back into the main branch

# Part 1: Setup and Initial Configuration

## 1. Install Git:
1. I visit [Official Git website](https://git-scm.com/)

![1. Official Git Website](./IMG/1.%20Git%20Official%20Website.png)

2. Then i click on `download for windows` to download it on my window environment because I am currenly using window 
![2. Download for Windows](./IMG/2.%20Download%20for%20Windows.png)

## 2. Create a GitHub Repository:
1. I visit [GitHub Official website](https://github.com/)
2. Then login into my GitHub account because I already have GitHub account before.
3. After I successfully login to my GitHub account, I click on the plus sign (`+`) at the right top corner and select `New repository` to create a new repository
![Creating a new Repository](./IMG/3.%20Creating%20a%20new%20Respository.png)
4. Then I name my repository voting-website and I also initialize it with README file.
![New Repository](./IMG/4.%20New%20Respository.png)
5. Then i click on `Create` to create the new repository.
![Voting Website](./IMG/5.%20Voting%20Website.png)


## 3. Clone the Repository:
1. On the repository's page I click on `code` then selet `HTTPS` then copy the link.
![Clone Repository](./IMG/6.%20Clone%20the%20Repository.png)

2. I open the Git bash 
![Git Bash](./IMG/7.%20Git%20bash.png)

3. I create a new directory which I name `git-project` inside the existing `darey-traning` directory and clone the remote repository on the GitHub `voting-website` to my local repository.
![Cloning Remote to Local](./IMG/8.%20Cloning%20Remote%20to%20Local.png)

4. then I `cd` into `voting-website` directory and create a new file inside the directory called `index.html` using this command `touch index.html` then I `vim` into the file **index.html** then I input these words `This is the Admin creating an index.html file for Tom and Jerry.` and save the file with `wq!`, then I check the status with `git status` command and I noticed the **index.html** file has a red color and is under untrack that means Git doesn't know about the file then I run this command to notice Git about the new file `git add index.html` and the ran `git status` and I sew the file is now green and ready to be committed.
then I ran `git commit -m "My first commit"` then I ran `git status` again the nothing was found everywhere is clean.
![Adding file to Git](./IMG/9.%20Creating%20and%20Adding%20new%20index.html%20file.png)
**------------------------------------------------------**
![Commiting my Work](./IMG/10.%20Commit.png)

5. The last part on the session was to push my work on my local repository into my remote repository.
![Push to Remote Repository](./IMG/11.%20Push%20to%20Remote.png)

# Part 2: Simulating Tom and Jerry's Work
This part was to create another branch different from the main branch where Tom and Jerry can work seperatly before merging their work to the main branch.

## 1. Tom's Work:
1. I navigate to the directory I clone from the remote repository which is `voting-website` with this command `cd voting-website`, and check my branch I already have and i saw that only `main` branch is available because is the defalut branch created by Git.
![Git Branch](./IMG/12.%20Git%20Branch.png)
2. I create a new branch called **_"Tom-branch_** and switch to the branch so that Tom can do all his work there before he merge it to the main branch.
The command I use to create the branch and switch to the new branch is `git checkout -b Tom-branch`.
![Tom's Branch](./IMG/13.%20Tom%20Branch.png)
3. Then Tom's edit the index file and include this content `This is Tom adding Navigation to the AI-website`, After I check the status and it was red then I add the edited file index.html with `git add index.html` to prepare it for commit, then i check `git status` again now it was green which means is now ready to commit, I use this command to commit it `git commit -m "Update navigation bar"`.
![Tom's Commit](./IMG/14.%20Tom%20Editing%20Index.png)
**----------------------------------------------------------------------**
![Tom's Commit 2](./IMG/15.%20Tom's%20Commit.png)

4. Then I push the branch to the remote repository
with this command `git push origin tom-branch`
![Tom's Push His Branch](./IMG/16.%20Tom's%20Push%20Branch.png)

## Jerry's Work:

1. I switched from tom's branch `tom-branch` back to the main branch.
![Switch Branch from Tom's Branch to Main Branch](./IMG/17.%20Switch%20to%20main%20from%20Tom%20Branch.png)
2. Then I pull the Tom branch from the GitHub (remote repository) back to the main branch  so that jerry can have the latest updates to work it.
![Pull Tom's Branch to Main Branch](./IMG/18.%20Pull%20Tom's%20work.png)

3. Then I create a new branch called `add-contact-info` for Jerry work ans also switched to that branch.
![New Branch for Jerry](./IMG/19.%20Creating%20a%20new%20Branch%20for%20Jerry.png)

4. Adding contact info to the existing index.html file with thsi command `vim index.html`.
![Adding Contact info into Index.html file](./IMG/20.%20Adding%20Contact%20Info.png)
5. After that I ran `git status` to check the status of the branch and it was red then I ran `git add index.html` to prepare it for commiting then ran `git status` again and now it was green which means commit can happen now on the branch and on the file than i ran `git commit -m "Add contact information"` then check the status again with `git status` and the branch is clean which means it has been committed (saved).
![Committing Jerry's Work](./IMG/21.%20Jerry's%20Commit.png)

6. After committing Jerry's work I now push the branch to the GitHub (remote repository) to make it visible to other crew member working on the project with this command `git push origin add-contact-info`.
![Jerry's Push His Branch to GitHub](./IMG/22.%20Jerry's%20Push%20to%20GitHub.png)








