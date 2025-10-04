# 🗂️ Archive Older or Large Files

This project is a **Bash automation script** that compresses and archives files that are either older than a specific number of days or exceed a certain file size limit.  
It helps maintain free disk space on servers and systems by moving unused or large files into an `archive` directory for future use.

---

## 📌 Script Location
`Shell-Scripting/Projects/Archive_Older_Or_Large_Files/archive.sh`

---

## 🚀 Features
- Scans a target directory for:
  - Files **older than a defined number of days**
  - Files **larger than a defined size**
- Automatically compresses those files.
- Moves compressed files into an `archive/` folder.
- Can be scheduled using a **cron job** for daily cleanup.

---

## 💡 Why This Script?
Over time, servers accumulate large or outdated files which consume valuable disk space.  
Running this script periodically helps:
- Prevent disk overuse.
- Keep file systems clean and organized.
- Maintain archived backups for later reference.

---

## 🛠️ Steps Performed by Script
1. Accepts or defines the target directory.
2. Checks if the directory exists.
3. Creates an `archive/` folder if it doesn’t already exist.
4. Finds files exceeding the set size or age.
5. Compresses them (`tar`, `gzip` etc.)
6. Moves the archives into the `archive/` folder.
7. (Optional) Add a cron job to automate daily execution.

---

## ⚙️ Usage
```bash
chmod +x archive.sh
./archive.sh

