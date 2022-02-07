#!/bin/bash

# Location of scripts
PASSWORD_CHECK='./passwordCheck.sh'
FOLDER_CREATOR='./foldermaker.sh'
FOLDER_COPIER='./folderCopier.sh'
SET_PASSWORD='./setPassword.sh'
CALCULATOR='./calculator.sh'
WEEK_FOLDERS='./megafoldermaker.sh'
CHECK_FILENAMES='./filenames.sh'
DOWNLOAD_FILE='./downloader.sh'

# Commands
EXIT_COMMAND='exit'

# Run password check script
bash $PASSWORD_CHECK

# Store exit code of password check
checkResult=$?

# If exit code is 0, show menu
if [ "0" -eq "$checkResult" ]; then

  promptSelection=""

  while [ "$promptSelection" != "$EXIT_COMMAND" ]; do

    # Output menu and prompt
    echo -e "\033[34m" # change font colour for heading an add spacing
    echo "Select an option:"
    # Change font colour for options
    echo -e -n "\033[36m"
    echo "1. Create a folder"
    echo "2. Copy a folder"
    echo "3. Set a password"
    echo "4. Calculator"
    echo "5. Create week folders"
    echo "6. Check filenames"
    echo "7. Download a file"
    # Reset font colour for exit option
    echo -e -n "\033[0m"
    echo "8. Exit"
    echo ""

    # Get users selection
    read -p "" promptSelection

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
      
      4) # Calculator
        script="$CALCULATOR"
        ;;
        
      5) # Create week folders
        script="$WEEK_FOLDERS"
        ;;
        
      6) # Check filenames
        script="$CHECK_FILENAMES"
        ;;
        
      7) # Download a file
        script="$DOWNLOAD_FILE"
        ;;

      8) # Exit script
        promptSelection="$EXIT_COMMAND"
        ;;

    esac

    # Run selected script
    if [ ! -z "$script" ]; then
      bash $script
    elif [ "$promptSelection" != "$EXIT_COMMAND" ]; then
      echo -e "\033[4;31mInvalid prompt selected\033[0m"
    fi
  
  done

fi

echo "Goodbye"

exit 0