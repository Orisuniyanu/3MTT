# Adding Comments in Bash Scripts

Comments are essential in programming, serving as notes to the programmer and anyone else who might read the code.

They explain what the script or parts of the script do, making the code easier to understand and maintain. This section will guide you on how to add comments in Bash scripts.

## What Are Comments?

Comments are lines in your code that are ignored by the interpreter. In Bash scripts, comments help document the purpose and logic of your code, making it easier for others (and yourself) to follow and understand the script's functionality.

## Single-Line Comments

Single-line comments in Bash start with the `#` symbol. Anything following this symbol on the same line is treated as a comment and is not executed.
---
## Tasks
- I create a new file with vi using `vi single_line_comment` then I place the below content inside the file then save it with `wq!`.

```bash
# This is a single-line comment in Bash

echo "Hello, you are learning Bash Scripting on DAREY.IO!" # This is also a comment, following a command
```
![1. Input Single](./1.%20Input%20Single.png)
## Using Multiple Single-Line Comments

- Then I add executable permission for the owner, for me to able to run the script `chmod u+x`
- After that I ran to script to see how single line comment works where is use this command `./single_line_comment`.
![2. Single Comment](./2.%20Single%20Comment.png)
---

## Multiple Single-Line Comment
1. I create another file with vi, `vi multiple_comments.sh`, then I place the content below inside it.
```bash then save the file
# This is another way to create
# a multi-line comment. Each line
# is prefixed with a # symbol.
echo "Here is an actual code that gets executed"
```
2. I add executable permission to the owner `chmod u+x multiple_comments.sh`
3. Then I ran the script with `./multiple_comments.sh`
![3. Multiple Comment](./3.%20Multiple%20Comments.png)
The Above image shows that only the part that doesn't include **#** will be printed to the terminal.
This approach is straightforward and is commonly used for adding brief descriptions or notes spanning multiple lines.

## Best Practices for Commenting

- **Clarity**: Write clear and concise comments that explain the "why" behind the code, not just the "what"
- **Maintainability**: Keep comments updated as you modify the code to ensure they remain relevant and helpful.
- **Usefulness**: Comment on complex or non-obvious parts of the script to provide insights into your thought process and decision-making.
- **Avoid Overcommenting**: Don't comment on every line of code, especially if the code is self-explanatory. Focus on parts that benefit from additional explanation.
![4. Comment](./4.%20Comments.png)
The above image show to use comment in a shell scripting.
---

At this stage, you've established a solid foundation in Bash/shell scripting. *(It's worth noting that Bash and Shell are similar in functionality, which is why their names are often used interchangeably, despite being distinct interpreters.)*

---
## TASK
1. I create a file with vi in this directory `~/shell-scripting` which I name `commented_script.sh`
```bash
vi commented_script.sh
```
![5. Commented](./IMG/5.%20Commented%20File.png)

2. Then I place the below content inside the file
```bash

# This is to display the purpose of using comment in a shell script
# This will include single line comment, multiple line comment and in-line comment

# Creating 3 Directories in my my directory
mkdir ~/Folder1   # This will create a new directory called Folder1 in the home directory
mkdir ~/Folder2   # This will create a new directory called Folder2 in the home directory
mkdir ~/Folder3   # This will create a new directory called Folder3 in the home directory

ls -l ~/Folder*   #This will display the content including files and directories in my home directory


# Now this is to show how multiple comment also works in bash script
# This is to print a goodbye message on the terminal
echo "Goodbye for now I will see you in the next class, bye! cheers guys"

```
![6. VIM File](./IMG/6.%20VIM%20File.png)

3. After that I change the permission for the owner using `chmod` to give me the permission to execute the `commented_script.sh`script, which changed the color to green after adding the executable permission.

```bash
chmod u+x commented_script.sh
```
![7. Change Permission](./IMG/7.%20Change%20Permission.png)
4. Then I ran the script to see how the commented part will come and none was printed to the terminal except for those I don't add **#** in front, this make me understand how to use comment in bash script effectively.
![8. Showing Result](./IMG/8.%20Showing%20Result.png)
![9. Show Working](./IMG/9.%20Show%20Working.png)

**End of Project**

