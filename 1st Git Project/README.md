# Second Mini Project: Simulating Git Workflow with Tom and Jerry

## Prerequisites
Ensure Git is installed on your system. If not, install it from [git-scm.com](https://git-scm.com/).

## Step 1: Initialize a Git Repository
```bash
mkdir git-mini-project && cd git-mini-project
git init
echo "<html><head><title>AI Startup</title></head><body><h1>Welcome to AI Startup</h1></body></html>" > index.html
git add index.html
git commit -m "Initial commit - Added index.html"
```

## Step 2: Simulating Tom’s Work (Updating Navigation)
```bash
git checkout -b update-navigation
echo "<nav><a href='home.html'>Home</a> | <a href='about.html'>About Us</a> | <a href='services.html'>Services</a> | <a href='contact.html'>Contact</a></nav>" >> index.html
git add index.html
git commit -m "Added navigation bar"
git push origin update-navigation
```

## Step 3: Simulating Jerry’s Work (Adding Contact Information)
```bash
git checkout main
git checkout -b add-contact-info
echo "<footer><p>Contact us at: contact@aistartup.com</p></footer>" >> index.html
git add index.html
git commit -m "Added contact information to footer"
git push origin add-contact-info
```

## Step 4: Merging Tom’s Changes First
```bash
git checkout main
git merge update-navigation
git push origin main
```

## Step 5: Merging Jerry’s Changes (Handling Merge Conflicts)
```bash
git checkout add-contact-info
git merge main
```
- If there's a merge conflict in `index.html`, resolve it manually, save the file, and continue.
```bash
git add index.html
git commit -m "Resolved merge conflicts and added contact info"
git checkout main
git merge add-contact-info
git push origin main
```

## Step 6: Verification
Run the following command to check the commit history:
```bash
git log --oneline --graph --all
```

## Conclusion
You have successfully simulated a real-world Git workflow where two developers (Tom and Jerry) worked on different features without overwriting each other's work.
