
# Advanced Linux Commands

## File Permissions and Access Rights

Understanding how to manage file permissions and ownership is crucial in Linux. This knowledge empowers you to control access to files and directories, ensuring the security and integrity of your system. Let's explore some essential commands and concepts.

---

## 🧮 Numeric Representation of Permissions

Each permission is assigned a numeric value:

- `read (r)` = **4**
- `write (w)` = **2**
- `execute (x)` = **1**
- `no permissions` = **0**

These values are combined for each user class (owner, group, others).

### Example 1: `7` - Full Permissions
- 4 + 2 + 1 = **7**
- Symbolic: `rwx`
- Meaning: Read, write, and execute
- 📌 **Use case**: Script file

### Example 2: `5` - Read & Execute
- 4 + 1 = **5**
- Symbolic: `r-x`
- 📌 **Use case**: Shared library

### Example 3: `6` - Read & Write
- 4 + 2 = **6**
- Symbolic: `rw-`
- 📌 **Use case**: Config file

---

## 🧑‍🤝‍🧑 Understanding User Classes

There are three main classes:
- **Owner** (user)
- **Group**
- **Others**

### 🔠 Symbolic Format
Example: `-rwxr-xr--`
- `-` → File type (dash for file, `d` for directory)
- `rwx` → Owner
- `r-x` → Group
- `r--` → Others

### Example Terminal Output

```bash
ls -latr
```

🖼️ ![1. List Permission](./IMG/1.%20List%20Permission.png)

---

## 🔧 File Permission Commands

To manage file permission and ownership, Linux provides several commands: 
### `chmod` – Change Permissions

```bash
touch script.sh
ls -latr script.sh
```

Initial permissions:
```text
-rw-r--r--
```

### Grant execute permission:
```bash
chmod +x script.sh
ls -latr script.sh
```

Result:
```text
-rwxr-xr-x
```

🖼️ ![2. Changing Permission Symbolic](./IMG/2.%20Changing%20Permission%20Symbolic.png)

### Numeric Method:
```bash
chmod 755 script.sh
```

Breakdown:
- 7 → `rwx` (owner)
- 5 → `r-x` (group)
- 5 → `r-x` (others)

### Set all permissions:
```bash
chmod 777 note.txt
```

🖼️ ![3. Numeric Permission](./IMG/3.%20Changing%20Permission%20Numeric.png)

---

## 👑 `chown` – Change Ownership

Format:
```bash
chown [owner][:group] filename
```

Example:
```bash
chown john:developer filename.txt
```

🖼️ ![4. Chown](./IMG/4.%20Chown.png)

---

## 🔐 Superuser Privileges

To perform admin tasks temporarily:
```bash
sudo command
```

To switch to root:
```bash
sudo -i
```

To exit root shell:
```bash
exit
```

🖼️ ![5. sudo -i](./IMG/5.%20Sudo%20-i.png)

---

## 👥 User Management on Linux

### ➕ Creating a New User

```bash
sudo adduser johndoe
```

This prompts for:
- Password

A home directory `/home/johndoe` is created.

---

### 🛡️ Granting Sudo Access

```bash
sudo usermod -aG sudo johndoe
```

- `-aG`: Append user to group
- `sudo`: Group with administrative privileges
🖼️ ![6. Adding New User](./IMG/6.%20Adding%20User.png)

---


## 📌 Tasks 
- I log out and log back in as the `johndoe` user
- then navigate to `/home/johndoe` using:
  ```bash
  cd /home/johndoe
  ```
  🖼️![7. Login Johndoe](./IMG/7.%20Login%20to%20Johndoe.png)

## 🔄 Switching Users

To switch to another user:
```bash
su - johndoe
```

To return:
```bash
exit
```

🖼️ ![8. switch user](./IMG/8.%20Switch%20User.png)

## Modifying User Accounts
### Changing User Password
To change any user password I use this command `passwd` follow by the user I want to change it password.
```bash
sudo passwd johndoe
```
Then it prompt me to enter and confirm the new password for the user.
After that I logout of `johndoe` shell and login again to check if the new password I set is correctly configured.

## Creating a New Group
To create a group I use this bash command `groupadd` follow by the name I want to give the group. For the instance I use in my project is to create a new group called `developer`.
```bash
sudo groupadd developer
```

## Adding Users to Other groups
To add users to another group I use `usermod` follow with some other arugument like `a` - to append and `G` - supplementary groups. for instance to add developer to the list of group johndoe already is.
```bash
sudo usermod -aG developer johndoe
```

## Verifying Group Memberships
To confirm detail about a user like the uid, gid and all the group associated with the user I use `id` follow by the user.
```bash
id johndoe
```

## Deleting a User
To delete a user I use `userdel` follow by the user
```bash
sudo userdel -rf johndoe
```
the option -rf means to remove the home directory associated with the user and to force it.
🖼️![9. Johndoe](./IMG/9.%20Johndoe.png)

## Ensuring Proper Group Permissions
Group in Linux are often used to manage permission for files and directories. Ensure that the relevant files or directories have the appropriate group ownership and permissions. For example, I grant the "developer" group ownership of a directory:
```bash
sudo chown :developer snap
```
🖼️![10. Group Permission](./IMG/10.%20Group%20Permission.png)
And to grant the group "developer read and write permission, I use 
```bash
sudo chmod g+rw snap
```
🖼️![11. Chmod](./IMG/11.%20Chmod.png)

## Side Hustle Task 3:
1. I create a new group which I name `devops`
```bash
sudo groupadd devops
```
🖼️![12. Devops Group](./IMG/12.%20Devops%20group.png)
2. After that i create 5 new users `["mary", "mohammed", "ravi", "tunji", "sofia"]`, and I also make sure all these users belong to devops group.
🖼️![13. New users](./IMG/13.%20New%20Users.png)
🖼️![14. ID User](./IMG/14%20.%20ID%20User.png)
3. Then I make sure to create a directory in `/home` directory for each of the new user, with this command
```bash
sudo mkdir mary mohammed tunji ravi sofia
```
🖼️![15. Making Directory](./IMG/15.%20Making%20Directory.png)
4. After I finished create the directories for all the new user, I make sure to associate those to the user as their "**home**" directory by changing the ownership of those directories and the group to "**devops**". Here is the command I use:
```bash
sudo chown -R mary:devops mary/
sudo chown -R mohammed:devops mohammed
sudo chown -R tunji:devops tunji
sudo chown -R ravi:devops ravi
sudo chown -R sofia:devops sofia
```
🖼️![16. Changing Permission](./IMG/16.%20Changing%20Permissiom.png)
