#!/bin/bash

# Ask user for folder name
read -p "Type the name of the folder you would like to create:" folderName

# Check if folder name is not empty
if [[ ! -z "$folderName" ]]; then

  # Make the directory
  mkdir "$folderName"

else

  # Show error and exit with code 1
  echo "Please enter a valid folder name"
  exit 1

fi

exit 0
