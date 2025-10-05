# 🧑‍💼 User Management Script

## 📘 Overview
This project contains a **Bash script (`user.sh`)** that automates user creation on a Linux system with auto-generated passwords and essential checks.

The script ensures it’s executed with **root privileges**, accepts a **username and optional comment**, generates a secure random password, creates the user, forces a password change on first login, and displays user details.

---

## ⚙️ Requirements & Behavior
- Must be executed as **root**; otherwise, exits with status code `1` and an error message.  
- Accepts arguments:
  - **1st argument:** username (mandatory)
  - **Remaining arguments:** comment / full name (optional)
- Automatically generates a secure password.
- Displays, upon success:  
  username: <username>  
  password: <auto_generated_password>  
  host: <hostname>  
- Forces the user to change the password on first login.

---

## 🧩 Steps Performed by Script
1. Verify superuser privileges.  
2. Validate that at least one argument (username) is provided.  
3. Store first argument as **username**, and remaining as **comment**.  
4. Generate a secure random password.  
5. Create the user using `useradd` and assign the password.  
6. Verify that user creation succeeded.  
7. Force password change on first login using `passwd -e <username>` or `chage -d 0 <username>`.  
8. Display username, password, and hostname.

---

## 🖥️ Usage
Make the script executable:

chmod +x user.sh
```bash
