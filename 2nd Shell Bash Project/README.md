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

**End of Project**

