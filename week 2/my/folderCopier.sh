#!/bin/bash

read -p "Type the name of the folder you would like to copy:" folderName

# If the directory is valid
if [ -d "$folderName" ]; then

  # Copy the folder to a new location

  read -p "Type the name of the destination folder" newFolderName

  cp -r "$folderName" "$newFolderName"

else

  # Otherwise, print an error
  echo "I couldn't find that folder"
  exit 1

fi

exit 0