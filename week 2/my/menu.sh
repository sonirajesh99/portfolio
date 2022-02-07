#!/bin/bash

# Location of scripts
PASSWORD_CHECK='./passwordCheck.sh'
FOLDER_CREATOR='./foldermaker.sh'
FOLDER_COPIER='./folderCopier.sh'
SET_PASSWORD='./setPassword.sh'

# Run password check script
bash $PASSWORD_CHECK

# Store exit code of password check
checkResult=$?

# If exit code is 0, show menu
if [ "0" -eq "$checkResult" ]; then

  # Output menu and prompt
  echo ""
  echo "1. Create a folder"
  echo "2. Copy a folder"
  echo "3. Set a password"
  echo ""

  # Get users selection
  read -p "Select an option:" promptSelection

  # Store selected script
  script=""

  case "$promptSelection" in

    1) # Create folder
      script="$FOLDER_CREATOR"
      ;;
      
    2) # Copy folder
      script="$FOLDER_COPIER"
      ;;
      
    3) # Set password
      script="$SET_PASSWORD"
      ;;

  esac

  # Run selected script
  if [ ! -z "$script" ]; then
    bash $script
  else
    echo "Invalid prompt selected"
  fi

fi

echo "Goodbye"

exit 0