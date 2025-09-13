# Week 3: Linux DevOps Challenge

## Challenge Overview

This week’s challenge focuses on **practical Linux administration tasks** using Bash scripting. It is divided into **two main challenges**:

1. **User Account Management**
2. **Automated Backup with Rotation & Recovery using Cron**

---

## Challenge 1: User Account Management

### Features

* **Create User (`-c | --create`)**

  * Prompt for a new username and password
  * Validate username availability
  * Display success message

* **Delete User (`-d | --delete`)**

  * Prompt for username to delete
  * Validate existence
  * Confirm deletion

* **Reset Password (`-r | --reset`)**

  * Prompt for username and new password
  * Validate existence
  * Display confirmation

* **List Users (`-l | --list`)**

  * Show all usernames with their UIDs

* **Help (`-h | --help`)**

  * Display usage instructions

### Key Takeaway

This script automates **common Linux user management tasks**, saving time, reducing human error, and providing a foundation for **real-world DevOps practices**.

---

## Challenge 2: Automated Backup with Rotation & Recovery

### Features

* Create **timestamped backups** of a given directory
* Store backups in a configurable folder (e.g., `/home/ubuntu/backups`)
* Implement **rotation**: Keep only the **latest 3 backups**, delete older ones automatically
* Optional: **Automate with Cron** for scheduled backups
* Validate backups and allow recovery

### Example Usage

```bash
# Backup a directory
./backup.sh /home/ubuntu/data

# Resulting backup folder
/home/ubuntu/backups/backup_2025-09-13_14-35-07
```

### Key Takeaway

Automation ensures **reliable, repeatable backups** in production environments. Using timestamps and rotation policies **prevents data loss and storage clutter**, a core skill for DevOps engineers.

---

## Real-World DevOps Connection

* Automating user management and backups reduces **manual intervention** and **human errors**.
* These scripts are a foundation for **Infrastructure as Code (IaC)** and server management in **production systems**.
* Skills learned here are directly applicable to **multi-server environments**, **cloud infrastructure**, and **continuous operations**.

---

## How to Run

1. Clone the repository
2. Give execute permissions:

```bash
chmod +x usermgmt.sh backup.sh
```

3. Run the scripts with required options:

```bash
./usermgmt.sh -c        # Create user
./backup.sh /path/to/data   # Backup directory
```

---

## Author

* \[Sirsha Thapa]
* \#90DaysOfDevOps | Linux | Bash Scripting | DevOps Fundamentals

---
