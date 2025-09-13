#!/bin/bash

src_dir=$1  #Take a directory path as a command-line argument

if [ ! -d "$src_dir" ]; then     #Check if directory is available or not
    echo "Error: Directory '$src_dir' does not exist."
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S") # prints current date and time and store it in variable 

#echo "$TIMESTAMP"

Backup_dir="/home/ubuntu/backups" #assigning backup directory path to variable

backup_file="backup_$TIMESTAMP.zip"  #assigning backup file with timestamp in variable


zip -r "$Backup_dir/$backup_file" $src_dir #compress the source file and store in backup directory

if [ $? -eq 0 ]; then                                   #$? is a special variable in Bash that stores the exit status of the last executed command. 
        echo "Backup created: ${backup_file}"
    else
       echo "Error: Failed to create backup."
       exit 1
fi


# --- Rotation: Keep only last 3 backups ---
# List all backup folders sorted by newest first

BACKUPS=($(ls -dt $Backup_dir/backup_[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]_*)) #list files/directories, sort by modification time (newest first),stores the list as a Bash array
COUNT=${#BACKUPS[@]} #gets the number of elements in the BACKUPS array

echo "$COUNT"

if [ "$COUNT" -gt 3 ]; then #Checks if there are more than 3 backups, 
  for (( i=3; i<$COUNT; i++ )) #Starts a for loop from index 3 to COUNT-1. Here BACKUPS[0] is new latest and BACKUPS[2] is third 
  do
    rm -rf "${BACKUPS[$i]}"  # it will delete BACKUPS[3] which is 4th backup
    echo "Old backup deleted: ${BACKUPS[$i]}" #If yes → delete older backups, keeping only the latest 3.
   done
fi
