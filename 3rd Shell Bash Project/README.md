
---

# 🌀 Control Flow in Shell Scripting

Control flow statements are the backbone of decision-making in programming. In shell scripting, they allow your scripts to decide what to do based on conditions, loops, or user inputs.

## 🎯 What is Control Flow?

In simple terms, control flow directs the order in which commands or instructions are executed in a script. Think of it like a roadmap that decides:
- Which path to take based on certain conditions
- How many times to repeat a task (loop)

---

## 🔁 Types of Control Flow in Bash

Shell interpreters like **Bash** provide several control flow statements:

- `if-else`
- `for` loops
- `while` loops
- `case` statements

---

## ✳️ Getting Started

### Step 1: Create the script
I power on my Ubuntu Server on Virtual oracle box, then I move to one of my existing directory on my home directory which is named Bash-script `cd Bash-script`, After that I create a new file which I name `control_flow.sh`

```bash
cd Bash-script
vim control_flow.sh
```
![1. Control Flow](./IMG/1.%20Control%20Flow.png)

### Step 2: Add the code below
Then I type the below words to my `control_flow.sh` file and save the file with `wq!`.
```bash
#!/bin/bash
read -p "Enter a number: " num
```
![2. VIM](./IMG/2.%20VIM.png)
### Step 3: Run the script
So before I run the script, I make sure to change the permission so that the me the owner can have execute permnission, then I run the script with `bash` command.
```bash
chmod u+x control_flow.sh
bash control_flow.sh
```
When I run this, it ask me:
```
Enter a number:
```
Even when you enter a number, it doesn't visibly react because it's storing my input in a variable called `num`.
![3. Run the Script](./IMG/3.%20Run%20the%20Script.png)
---

## 🧠 Understanding the `read` command

```bash
read -p "Enter a number: " num
```

- `read` is used to capture user input
- `-p` displays a message prompt
- `num` is the variable where the input is stored

---

## ✅ Echo the input

Update my script:
I ran the vim command again `vim control_flow.sh` then I update the exist words inside the file with the words below.
```bash
#!/bin/bash
read -p "Enter a number: " num
echo "You have entered the number $num"
```
![4. Update VIM](./IMG/4.%20Update%20VIM.png)

Now when I run it, the value is echoed back.
![5. Echoed Back](./IMG/5.%20Echo%20Back.png)
---

## 🔍 Using `if` Statement

The if statement in Bash scripts allows you to execute commands based on conditions.
### Syntax:

```bash
if [ condition ]; then
  commands
fi
```

- `if`: begins the block
- `[ condition ]`: test condition
- `then`: code to run if condition is true
- `fi`: ends the block

### Example:
I create another file which I name `check_number.sh`with this command `vim check_number.sh`,then input the below word inside. I also change the permission with `chmod u+x check_number.sh`, then run the script with `bash` 
```bash
#!/bin/bash
read -p "Enter a number: " num
echo "You have entered the number $num"

if [ $num -gt 0 ]; then
  echo "The number is positive."
fi
```
![6. Check Number File](./IMG/6.%20FLow%20File.png)

- `-gt` means "greater than" These are called operators that are used within the condition block to perform numeric comparisons between values.

![7. Number](./IMG/7.%20Number.png)
---

## 🔄 Using `elif` Statement
After understanding the if statement, I move on to the elif part of control flow in Bash scripts. elif stands for "else if," allowing to test additional conditions if the previous if conditions were not met.

### Syntax:

```bash
if [ condition1 ]; then
  commands1
elif [ condition2 ]; then
  commands2
fi
```
- elif: This keyword is used right after an if or another elif block. It allows you to specify an alternative condition to test if the previous conditions were false.
- [condition2]: The new condition you want to evaluate. Like the if statement, this condition is enclosed in square brackets [].
- then: If the elif condition is true, execute the commands that follow this keyword.

### Updated Script:
I update the previous script name `check_number.sh` and I include the below word.
```bash
#!/bin/bash
read -p "Enter a number: " num
echo "You have entered the number $num"

if [ $num -gt 0 ]; then
  echo "The number is positive."
elif [ $num -lt 0 ]; then
  echo "The number is negative."
else
  echo "The number is zero."
fi
```
![8. Updated Script](./IMG/8.%20Updated%20Script.png)

- `-lt` means "less than"

![9. Rerun Script](./IMG/9.%20Rerun%20Script.png)
---

## 🔁 Loops in Bash

Loops help you automate repetitive tasks.

Loops empower us to automate and repeat tasks without writing the same code over and over again. Imagine having to perform a task, like sending a greeting message to each of your friends by name. Without loops, you'd have to write a separate command for each friend, which is not only tedious but also inefficient. Loops streamline this process by allowing you to write a single set of instructions that can be executed as many times as needed, making your script both cleaner and more powerful.
Some real world scenarios where loops are inevitable are;

### Real-world uses:
- **Batch Processing:** Suppose you have a folder full of photos you want to resize or edit in some way. Instead of editing each photo individually, a loop can automate this task, applying the same code to each photo in the folder.

- **Data Analysis:** If you're analyzing data, you might need to perform the same calculations on numerous data sets. A loop can iterate through each data set, apply the same code to do calculations, and collect the results.

- **Automated Testing:** In software development, loops are invaluable for running through numerous test cases. You can use a loop to automatically test different inputs for your program and verify that it behaves as expected using the same code.

In Bash scripting, there are three primary types of loops that are commonly used to repeat a set of commands multiple times based on certain conditions.
1. For
2. While &
3. Until


---

## 🔄 `for` Loop
The for loop is used to iterate over a list of values or a range of numbers. It is particularly useful when you know in advance how
many times you need to execute the loop body.
The for loop has two main forms:
1. List Form
2. C-style Form

## 1. List Form: Iterates over a list of items:
### Syntax:

```bash
for item in item1 item2 item3; do
  echo $item
done
```
- for: This keyword initiates the loop, signaling the start of a block of code that will repeat.
- item: This is a variable that temporarily holds the value of each item in the list as the loop iterates. For each iteration of the loop, item takes on the value of the next item in the list, allowing the commands inside the loop to act on this value. (If this is confusing, don't worry. You will see it in action soon)
- in: The in keyword is followed by a list of items that the loop will iterate over. This list can be a series of values, an array, or the
output of a command. The loop executes once for each item in this list.
- ;: A semicolon is used here to separate the list of items from the do keyword that follows. If you place the do keyword on the next line, the semicolon is optional.
- do: This keyword precedes the block of commands that will be executed for each item in the list. The block can contain one or multiple commands, and it can perform a wide range of actions, from simple echoes to complex conditional logic.
- done: This keyword marks the end of the loop. It signifies that all commands in the loop have been executed for each item in the list, and the loop is complete.

### Example:
I create another file with which I name `loop_list.sh`, then include the below words, change the permission and run the script.
```bash
#!/bin/bash
for i in 1 2 3 4 5; do
  echo "Hello, World! This is message $i"
done
```
![10. Loop](./IMG/10.%20Loop.png)

In this example:
- The loop starts with for i in 12345, meaning the variable i will take each value in the list (1, 2, 3, 4, 5) in turn.
- For each value of i, the loop executes the commands between do and done.
- The command echo "Hello, World! This is message $i" prints a greeting along with the current value of i. Once i has taken each value in the list, the loop ends.

![11. Run Loop List](./IMG/11.%20Run%20Loop%20List.png)
---

## 🔢 `for` Loop (Range Syntax)
In this example, I create another file which I name `loop_range.sh` then insert the below words to the file, giving the owne which is me executable permission, then I run the script to see it behaviour.
```bash
#!/bin/bash
for i in {1..5}; do
  echo "Counting... $i"
done
```
![12. VIM Loop Range](./IMG/12.%20VIM%20Range.png)
![13. Run Loop Range](./IMG/13.%20Run%20Range.png)
---

## 2. 👨‍💻 C-style `for` Loop

C-style Form: This style allows you to specify an initializer, condition, and increment/decrement expression. It is based on the same syntax used in doing a for loop in C Programming.

### Syntax:

```bash
for (( i=0; i<5; i++ )); do
  echo "Number $i"
done
```

---

## ✅ Task

1. Create another shell scripts for `for` C-style Form which I name `loop_cstyle.sh`
```bash
vim loop_cstyle.sh
```
2. Insert the example code above.
![14. C-Style](./IMG/14.%20C-Style.png)
3. Set executable permission using:

```bash
chmod +x loop_cstyle.sh
```

4. Run the script with `bash` and observe how each loop works:

```bash
bash loop_cstyle.sh
```
![15. Run C-Style](./IMG/15.%20Run%20Style.png)
---