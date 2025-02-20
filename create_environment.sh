#!/bin/bash

# This script sets up the directory structure and files for the assignment tracking app
# Prompt user for their name
echo -n "Kindly enter your name: " 
read user_name

# Setting up the base directory with the user's name
base_dir="assignment_tracker_${user_name}"

#Now creating  the structure of the directory
echo "Creating directory structure in ${base_dir}..."
mkdir -p "$base_dir/app" 
mkdir -p "$base_dir/modules" 
mkdir -p "$base_dir/assets"
mkdir -p "$base_dir/config"

# Create the reminder script in the directory
echo "Creating reminder.sh..."
cat << 'EOF' > "$base_dir/app/reminder.sh"
#!/bin/bash
# reminder.sh: Main script to display assignment alert

# Source configuration and helper functions
source ./config/config.env
source ./modules/functions.sh

# Define path to the submissions file
submissions_file="./assets/submissions.txt"

#Print the remaining time
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

# Check submission statuses
check_submissions "$submissions_file"
EOF

# Create the functions
echo "Creating functions.sh..."
cat << 'EOF' > "$base_dir/modules/functions.sh"
#!/bin/bash
# functions.sh: Contains functions for processing submissions

function check_submissions() {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

# Create the configuration file in config/
echo "Creating config.env..."
cat << 'EOF' > "$base_dir/config/config.env"

ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create the submissions file in assets/
echo "Creating submissions.txt and adding student records..."
echo "student,assignment,submission status" > "$base_dir/assets/submissions.txt"
cat << 'EOF' > "$base_dir/assets/submissions.txt"
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell Basics,submitted
Alice,Shell Navigation,not submitted
Bob,Git,submitted
Charlie,Shell Basics,not submitted
Diana,Git,submitted
Edward,Shell Basics,not submitted
Fiona,Git,not submitted
George,Shell Navigation,submitted
Hannah,Git,not submittted
Julia,Shell Navigation,not submitted
EOF

# Create the startup script in the base directory
echo "Creating startup.sh..."
cat << 'EOF' > "$base_dir/startup.sh"
#!/bin/bash


bash ./app/reminder.sh
EOF

# Set execute permissions for the scripts
chmod u+x "$base_dir/app/reminder.sh" 
chmod u+x "$base_dir/modules/functions.sh" 
chmod u+x "$base_dir/startup.sh"

echo "Environment setup complete in directory: ${base_dir}"
