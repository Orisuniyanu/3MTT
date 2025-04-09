# Capstone Project: Enhancing a Community Library Website
## Introduction
As part of Development team with task to enhance the website **"Greenwood Community Library"**. This website aims is to be more engaging and informative for its visitors. It currrently includes basic section: **Home, About Us, Events, Contact Us**. 
There will be two more contributor adding and editing the project, the contributor will be: **"Morgan"** and **"Jamie"**.

## Obejectives Of the Project:
1. Practice cloning a repository and working with branches in Git.
2. Gain experience in staging, committing, and pushing changes from both developers.
3. Create pull requests and merge them after resolving any potential conflicts.

## Setup
1. I create a new repository on my GitHub account `orisuniyanu` and name the new repository `greenwood-library-website`, I also initialize it with a README.md file.
![1. New Repository](./IMG/1.%20New%20Repository.png)
**-----------------------------------------------------------------**
![2. Repository Created](./IMG/2.%20Repository%20Created.png)
2. After the new repository was created, I clone new remote repository on my GitHub account down to my local machine with this command `git clone https://github.com/Orisuniyanu/green-library-website.git`
![3. Clone remote to local](./IMG/3.%20Git%20Clone%20to%20Local.png)

## Tasks
1. I open my VS Code application and navugate to the directory I clone the remote repository to.
![4. Open VS Code](./IMG/4.%20Open%20VS%20Code.png)
2. Then I create four (4) additional files which are: 
   
    home.html

    about_us.html

    events.html

    contact_us.html
![5. Creating new files](./IMG/5.%20Creating%20new%20files.png)

3. Then I start adding some random html content on each files I just created.

i. About Us file
![6. About Us file](./IMG/6.%20About-Us%20file.png)

ii. Home file
![7. Home file](./IMG/7.%20Home%20file.png)

iii. Events file
![8. Events file](./IMG/8.%20Events%20file.png)

iv. Contact Us file
![9. Contact Us file](./IMG/9.%20Contact%20Us%20file.png)

4. After finshing adding some html content to the four files, then I check the status of the Git with `git status`, all the files was under untracked files (red color), then I ran ` git add about_us.html contact_us.html events.html home.html` to add the file to Git then it was now under `changes to be committed` (green color), lastly I commit the files with `git commit -m "Add 4 new html file"` then `git status` again and the branch is now clean like nothing to save.
![10. Commit the new FIles](./IMG/10.%20Commit%20the%20new%20files.png)
5. Then push the local branch to my remote branch on the GitHub with this command `git push origin main`.
![11. Push New Files](./IMG/11.%20Git%20Push%20new%20Files.png)

## Morgan's Work: Adding Book Reviews

1. I create a new branch for Morgan called `add-book-reviews` then switch to the new branch I created for Morgan, with this command `git checkout -b add-book-reviews`.
![12. Add ne Branch add-book-reviews](./IMG/12.%20New%20Branch%20Add%20Book%20Reviews.png)
2. So inside the new branch `add-book-reviews`, I create a new file which I name `book_reviews.html` and also I add some html content inside the file.
![13. Create a new file](./IMG/13.%20Add%20new%20file%20on%20the%20new%20Branch.png)
**------------------------------------------------------------------**
![14. Book Review Content](./IMG/14.%20Book%20Review%20Content.png)

3. Then I ran `git status` to check the status of the branch and the new file is still under untracked file, then i ran `git add book_reviews.html` to add the file to Git then I ran `git status` again to the the current status of the branch then is now under `changes to be committed:` (green color) which means is ready to be commit, then I ran `git commit -m "Adding Book Review file"`, then `git status` again then the branch is now clean nothing to commit.
![15. Book Review Commit](./IMG/15.%20Commit%20Book%20Review%20file.png)

4. Then I push the branch `add-book-reviews` to the remote repository on my GitHub account, with this command `git push origin add-book-reviews`
![16. Push Book Review Branch to GitHub](./IMG/16.%20Push%20Book%20Reviews%20Branch.png)
5. Then I navigate to my broswer and go to GitHub page to check the new branch I pushed from my local repository to remote repository (GitHub)
![17. GitHub Branches](./IMG/17.%20GitHub%20Branches.png)

6. Then on the GitHub I click on `main` at the top left corner and select the branch created for Morgan which is `add-book-reviews`. After that I click on `Contribute` then at then buttom I click on `Open pull request`.
![18. Preparing a Create a New Pull Request](./IMG/18.%20Preparing%20to%20Create%20Pull%20Request.png)
**----------------------------------------------------------------**
![19. Pull Request](./IMG/19.%20Pull%20Request.png)

7. Then the compare the Morgan's branch with the main branch, I noticed that the Morgan's branch is 1 commit ahead of the main branch because of the new file I added to Morgan branch `add-book-reviews`, then I add title to the request which is `Adding Book Review file` and also description `On this branch Morgan create a new file called "book_reviews.html" and added some html content to the file.`, then I click on `Create pull request` at the buttom.
![20. Create Pull Request](./IMG/20.%20Create%20Pull%20Request.png)
**----------------------------------------------------------------**
![21. Merge Pull Request](./IMG/21.%20Merge%20pull%20request.png)
8. Then I merge Morgan's to the main branch by clicking on `Merge pull request`and I added commit message which is `Merge pull request #1 from Orisuniyanu/add-book-reviews` and extended description which is `Adding Book Review file`, then I click on `Confirm merge`.
![22. Confirm Merge](./IMG/22.%20Confirm%20merge.png)
**---------------------------------------------------------------------**
![23. Successful merge](./IMG/23.%20Successful%20Merge.png)

## Jamie's Work: Updating Events Page
1. On the Git Bash, I switch back to main branch from Morgan's branch with `git checkout main`, then I pull the lastes update from the remote repository (GitHub) with `git pull origing main` command so that Jamie can have the lastest update to work with. then I create another branch for Jamie which I name `update-events` with `git checkout -b update-events`.
![24. Pull the latest Update](./IMG/24.%20Pull%20the%20Latest%20Update.png)
**-------------------------------------------------------------------**
![25. Creating new Branch for Jamie](./IMG/25.%20Creating%20new%20branch%20for%20Jamie.png)

2. Then Jamie work on the Event.html page, then stage the file, commit and push to the remote repository (GitHub)
![26. Editing Event file](./IMG/26.%20Editing%20Event%20file.png)
**-------------------------------------------------------------------**
![27. Commit Events File](./IMG/27.%20Commit%20Events%20File.png)

3. Then I push Jamie's repository which is still local to remote repository on the GitHub with this command `git push origin update-events`.
![28. Push Jamie's Work to GitHub](./IMG/28.%20Push%20Jamie's%20Work%20to%20GitHub.png)

4. Then I navigate to my GitHub and select the repository I am working on with is `green library website` then click on `branch` then I select Jamie's branch which is `update-events` then click on the `compare & pull request`.
![29. Compare it](./IMG/29.%20To%20Compare.png)

5. Then I was prompt to enter the title in which I put `Editing the events.html file` and Add a description in which I also put `Jamie edit the events.html file to fix some error dissolved inside the file.`, then click on `merge pull request` where I also insect commit message as `Merge pull request #2 from Orisuniyanu/update-events` and Extended description as `Editing the events.html file` and I click on `Confirm merge`.
![30. Compare Pull Request](./IMG/30.%20Create%20Pull%20Request.png)
**----------------------------------------------------------------**
![31. Merge Pull Request](./IMG/31.%20Merge%20pull%20request.png)
**----------------------------------------------------------------** 
![32. Comfirm Merge](./IMG/32.%20Confirm%20Merge.png)
6. Now everything is set and the merge is successful and the project is also a success.
![33. Everything is Set](./IMG/33.%20Everthing%20is%20set.png)
Thanks!

