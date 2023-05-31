#!/bin/bash

#Backup system

exitloop=0

until [ $exitloop -eq -1 ]
do
#Backup director
read -p "Enter the full path of the directory to be backed up: " dir
if [ ! -e "$dir" ];
then
    echo "Error: The specified directory does not exist"
exit 1
fi

#Destination directory
read -p "Enter the full path of the backup destination directory: " backupdir
if [ ! -d "$backupdir" ];
then
    echo "Error: The specified backup destination directory does not exist"
exit 1
fi

#Timestamp
timestamp=$(date "+%Y%m%d_%H%M")

#Backup document name
backupfile=${dir//\//-}

#Create backup file
tar -czf "$backupdir/$backupfile-$timestamp.tar.gz" "$dir"

#success msg
if [ $? -eq 0 ];
then
     echo "Backup of $dir was successful. Backup file (  $backupdir/$backupfile-$timestamp.tar.gz  )"
else
     echo "An error occurred could not backeup file"
fi

#Exit loop
read -p "If you are done and would like to exit please enter -1: " exitloop
done


