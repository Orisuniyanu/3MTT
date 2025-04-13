# LINUX TEXT EDITORS

A Linux text editor is a software application specifically designed for creating, modifying, and managing text files on a Linux-based operating system. Text editor play a crucial role in the Linux environment, providing a means for users to interact with and manipulate plain text files, configuration files, and scripts, and other text-based documents.

There are verious text editors available in the Linux ecosysystem, each has its own set of features and user interface. Some example of Linux text editor incluse Vim (vi), Edamc, Nano etc. In this project I explain some of the text editor as follow:

## VIM Text Editor

The Linux text editor, short for "Vi Improved", is a powerful and versatile text editing tool deeply ingrained in the Unix and Linux ecosystems. Vim builds upon the foundation of the original Vi editor, offering an extensive set of features, modes, and commands that empower users to manipulate text efficiently. 

## Working with VIM Editor

Here are some of the things I did with VIM Text Editor, as follow:
1. I open a new file with Vim which I name `exercise.txt`, using the following command in my home directory, `vim exercise.txt`, this open create the file for me and open the file to start adding contents I wiah to add.
![1. VIM](./IMG/1.%20VIM.png)
2. **Enter Insert Mode** to edit the file: 
After I enter the file, I press `i` to enter insert mode, then I input the following content:
    ```
    Hello, this is a Vim hands-on project.
    Welcome to darey.io.
    ```
    **Moving Around:**
    Then before I exit the text editor, I play around the content by moving around arrow keys and also with other keys like h (left), j (down), k(up), and i (right).
![2. Insert Mode](./IMG/2.%20Insert%20Mode.png)
3. **Deleting a Character**:
Then I try to delete some texts from the existing content, by pressing `esc` to exit from the insert mode, and I place my cursor on the charecter I want to delete which happen to be `darey.io` then I continue pressing `x` till the whole `darey.io` is completely deleted.
![3. Delete Mode](./IMG/3.%20Delete%20Mode.png)
4. **Deleting a Line:**
After I practise deleting charecter, I then move to practicing delete of a whole line at a go. I make sure I am not in the insert mode, by pressing `esc` to go back to the Normal mode. Then I moved the cursor on the line I want to delete, and press **`d`** twice to delete the entire line, which happen to be `Welcome to.`.
![4. Delete an entire Line](./IMG/4.%20Delete%20Line.png)
5. **Undoing Changes:**
After I delete those charecter and line, then I try to undo those changes. First thing is that I make sure I am in the Normal mode by pressing `esc` key, then I press u to undo those text I deleted previously.
![5. Undo Changes](./IMG/5.%20Undo%20Changes.png)
6. After all the practise I then save my work by following these steps, I make sure I am in the Normal mode by pressing `esc` key then I press `:wq`. But I can also use `wq!` this is to use force to quit the text editor and also save it. `w` mean write/save and `q` means quit the vim mode and returns back to the terminal.
![6. Save](./IMG/6.%20Save.png)


## Nano Text Editor

Among Linux text editors, Nano stands out as a user_friendly and straightforward tool, making it an execellent choice for users who are new to the command line or those who prefer a more intuitive editing experience.

## Working with Nano Text Editor

1. **Open a File**:
I user nano to open a new file called `"nano_project.txt"` in my home directory with this simple command: 
`nano nano_project.txt`, then I was taken to nano editor interface.
![7. Nano Interface](./IMG/7.%20Nano%20Interface.png)

2. Unlike Vim that I have to be in the insert mode to type text/character by pressing `"i"`, in nano immediately I am inside the interface I start adding text straight a way. 
Then I input the following text in the file: 
    ```
    I Love working with nano because of its simplicity and easy to navigate around.
    I also encourage other DevOps Engineer to make use of this great text editor.
    Thanks.
    ```
    ![8. Adding to Nano](./IMG/8.%20Adding%20to%20Nano.png)

3. After adding those text I make sure to save my work with `ctrl + o` then nano prompt me to confirm, and I press `Enter` to confirm.
![9. Save on Nano](./IMG/9.%20Save%20on%20Nano.png)

4. EXisting Nano: After I save my work on nano, I exit from nano interface with `ctrl + x` which return my back to my terminal that's because I have already save it before, if I am not save my work before and I press `ctrl + x` then nano will prompt me if I want to save type 'y' or don't save type `n`.
![10. Exit Nano](./IMG/10.%20Exit%20Nano.png)
5. Finally I used nano text editor to open an existing file I have in my home directory name `file1.txt` and play around it using different keys.
![11. Play with Nano](./IMG/12.%20Play%20with%20Nano.png)





