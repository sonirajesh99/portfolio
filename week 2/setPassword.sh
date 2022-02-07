#!/bin/bash

# Name of the file containing the password
SECRET_FILENAME='secret.txt';

# Ask user for folder name
read -p "Type the name of the folder you would like to create:" folderName

# Check if folder name is not empty and doesn't exist
if [[ ! -z "$folderName" && ! -d "$folderName" ]]; then

  # Ask user for secret password
  read -s -p "Type a secret password:" secretPassword

  # Check if secret password is not empty
  if [[ ! -z "$secretPassword" ]]; then

    # Make the directory
    mkdir "$folderName"

    # Hash and output the secret password to the secret file inside newly created folder 
    #   without changing current working directory
    $( cd "$folderName" && echo "$secretPassword" | sha256sum > "$SECRET_FILENAME" )
  
  else

    # Show error and exit with code 2
    echo ''
    echo "Please enter a secret password"
    exit 2

  fi

else

  # Show error and exit with code 1
  echo ''
  echo "Please enter a valid folder name"
  exit 1

fi

exit 0
