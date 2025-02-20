# Submission Reminder App

## Overview
The **Submission Reminder App** is a simple shell script-based application that alerts students about upcoming assignment deadlines. It sets up the necessary directory structure and files required for the application to function correctly.

## Features
- Automatically creates a structured directory for the app.
- Populates necessary files including `config.env`, `functions.sh`, `reminder.sh`, `submissions.txt`, and `startup.sh`.
- Requests the user's name and personalizes the main directory.
- Allows students to check pending submissions.
- Ensures scripts are executable upon creation.

## Directory Structure
After running the `create_environment.sh` script, the following structure will be created:

```
submission_reminder_{YourName}/
│── app/
│   └── reminder.sh
│── config/
│   └── config.env
│── modules/
│   └── functions.sh
│── assets/
│   └── submissions.txt
│── startup.sh
```

## Installation and Setup
### 1. Clone the Repository
```bash
git clone https://github.com/{githubusername}/submission_reminder_app.git
cd submission_reminder_app
```

### 2. Run the Environment Setup Script
```bash
bash create_environment.sh
```
You will be prompted to enter your name. The script will then create a directory named `submission_reminder_{YourName}` with all necessary files.

### 3. Start the Reminder Application
After the environment is set up, navigate to your directory and run:
```bash
cd submission_reminder_{YourName}
bash startup.sh
```
This will load the environment variables, check submissions, and display assignment details.

## File Descriptions
### `create_environment.sh`
This script sets up the entire environment, creating directories and files required for the application.

### `startup.sh`
Loads environment variables, checks for missing submissions, and displays assignment details.

### `reminder.sh`
Checks submission statuses and alerts students about pending assignments.

### `functions.sh`
Contains helper functions to process submission records.

### `config.env`
Stores configuration variables such as the assignment name and deadline.

### `submissions.txt`
Contains sample student submission data in CSV format.

## Notes
- Ensure you have execution permissions for scripts:
  ```bash
  chmod +x create_environment.sh startup.sh app/reminder.sh modules/functions.sh
  ```
- Modify `submissions.txt` to add new students or change statuses.
- The script is designed to run on Linux-based systems.

## License
This project is open-source and available for everyone to modify it.

## Author
Developed by Esther Digne Irakoze.
