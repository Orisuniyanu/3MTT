# Bash Script For Generating a Multiplication Table


## 🎯 Objective
Create a Bash script that will generates a multiplication table for a number entered by the user.  
This project helped me practice:

- Using **loops**
- Handling **user input**
- Applying **conditional logic**

---

## 📄 Project Description

The script will:

1. Prompt the user to enter a number.
2. Ask if they prefer:
   - A **full multiplication table** (1 to 10)
   - A **partial table** (user-specified range)
3. Based on the user's choice, display the appropriate multiplication table.

---

## ✅ Project Requirements

### 1. User Input for Number
- Prompt the user to input a number for which the multiplication table will be generated.

### 2. Choice of Table Range
- Ask the user to choose:
  - `'f'` for full table (1 to 10)
  - `'p'` for partial table
- If partial is selected, prompt for **start** and **end** of the range.

### 3. Use of Loops
- Use **for loops** (list) to generate the multiplication table.

### 4. Conditional Logic
- Use **if-else statements** to:
  - Check user's range input
  - Handle logic for full vs. partial display

### 5. Input Validation
- Ensure:
  - The number entered is valid
  - The range is within bounds (1 to 10)
  - Start ≤ End
- If validation fails → default to **full table**

### 6. Readable Output
- Display the table clearly and neatly.

### 7. Comments and Code Quality
- Use **clear comments** to explain my logic.
- Ensure **clean formatting** and indentation.

---
## 🌟 Bonus Features

### 🔁 Enhanced User Interaction
- Let user **repeat** the process without restarting the script.

### 🎨 Creative Display Options
- Let user choose **ascending** or **descending** order.

---

## 🧩 How I Solve This Project
Below are the steps I took to generate my Multiplication Table:
1. I create a new file in my `Bash-script` directory inside my home directory with vim.
```bash
vim calculator.sh
```
2. Then I input all the neccessary code that I make me complete this project:
```bash
#!/bin/bash

# Bash Script for Generating a Multiplication Table

# Function to generate table using a list form loop
generate_list_loop_table() {
    local number=$1
    local start=$2
    local end=$3
    local order=$4

    if [[ $order == "d" ]]; then
        for i in $(seq $end -1 $start); do
            echo "$number x $i = $((number * i))"
        done
    else
        for i in $(seq $start $end); do
            echo "$number x $i = $((number * i))"
        done
    fi
}

while true; do
    echo "Enter a number for the multiplication table:"
    read number

    # Check for valid number
    if ! [[ $number =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a positive number."
        continue
    fi

    echo "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial):"
    read table_type

    start=1
    end=10

    if [[ $table_type == "p" ]]; then
        echo "Enter the starting number (between 1 and 10):"
        read start
        echo "Enter the ending number (between 1 and 10):"
        read end

        # Validate range
        if ! [[ $start =~ ^[0-9]+$ && $end =~ ^[0-9]+$ ]] || (( start < 1 || end > 10 || start > end )); then
            echo "Invalid range. Showing full table instead."
            start=1
            end=10
        fi
    fi

    echo "How would you like the table displayed?"
    echo "Enter 'a' for ascending or 'd' for descending:"
    read order
    [[ $order != "a" && $order != "d" ]] && order="a"

    echo ""
    echo "=== Multiplication Table Using List Form Loop ==="
    generate_list_loop_table $number $start $end $order

    echo ""
    echo "Do you want to generate another table? (y/n):"
    read repeat
    [[ $repeat != "y" ]] && break
done
```
3. After that I make sure to give the owner which is me in this case the executable permission, for me to run the script.
```bash
chmod u+x calculator.sh
```
4. Then I run my script to see the result and it was perfect.
```bash
bash calculator.sh
```
![1. Calculator](./IMG/1.%20Calculator.png)
5. Here's the result of my script.

![2. First Result](./IMG/2.%20First%20Result.png)
![3. Second Result](./IMG/3.%20Second%20Result.png)
---

