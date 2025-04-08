# Hands-On Git Project: Collaborative Website Development with Git and GitHub
# Part3: Merging Changes
## Introduction
Merging Tom's and Jerry's work together on the main branch, This will include the following tasks:
1. Creating a pull request
2. Merging the Pull Request into **main** branch.


## Creating a Pull Request on GitHub

1. I open a my Google Chrome Browser and navigate to GitHub page for the repository.
2. Then I click on the branch dropdown near the left corner of the file list and select the branch Tom is working on which is `tom-branch`.
![1. Branches](./IMG/1.%20Branches.png)
3. Then I create a "New pull Request" by clicking on Tom's branch then click on `Contribute` at the right top corner then I click on `Open pull request`.
![2. Tom's Pull Request](./IMG/2.%20Tom's%20Pull%20Request.png)
4. I review Tom's changes and compare the Tom's branch which is `tom-branch` with the main branch to see the difference between the two branches.
5. After I checked everything look, and ready to request for a pull, then I provide a Title `Update index.html file` for the pull request and description **"The index.html file contain a sentence that describe the main content of the index file.
This is done by Tom."** after that I click on the `Create pull Request` again to finally officially open the pull request.
![3. Description on the Pull Request](./IMG/3.%20Description%20on%20the%20Pull%20Request.png)

## Updating Jerry's Branch with Latest Changes
1. Before I merge Jerry's work to the main branch I make sure the project is up to date to ensure Jerry's can pull the latest update by merging Tom's work to the main branch. 
This update will ensure compatibility and reduces the chance of conflicts. 
2. On the Git Bash terminal, I switched to Jerry's Branch which is `add-contact-info` by running this command on the terminal `git checkout add-contact-info`, then pull the latest update from the main branch to Jerry's branch `add-contact-info` by running the command `git pull origin main`, this command will fetches the changes from the main branch which now has Tom's changes and merge them into Jerry's `add-contact-info` branch. 
![4. Merge main branch to Jerry's branch](./IMG/4.%20Updating%20Jerry's%20Branch%20to%20Latest.png)

3. Then I merge the branch to the main branch on the GitHub.
![5. Merge](./IMG/5.%20Merging.png)

3. So there was no conflict on the branch on the GitHub which means the branches are up to date, then I pull the branch to the remote repository (GitHub).
![6. Push](./IMG/6.%20Push.png)

