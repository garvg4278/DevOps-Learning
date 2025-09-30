# 💾 Disk Space Monitor

This project is a **Bash script** that monitors free disk space on the system and reports usage status.  
It can be extended to send alerts (e.g., email) when disk usage crosses a threshold.

---

## 📌 Script Location
`Shell-Scripting/Projects/Disk_Space_Monitor/fs_status.sh`

---

## 🚀 Features
- Displays free and used disk space using `df -h`.
- Highlights partitions where usage exceeds **80%**.
- Logs the results into a file with a timestamp.
- Can be extended to **send email alerts** in case of critical usage.

---

## 🛠️ Usage
Give execute permission and run:
```bash
chmod +x fs_status.sh
./fs_status.sh

