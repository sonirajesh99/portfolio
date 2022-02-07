#!/bin/bash

# References
#  - https://man7.org/linux/man-pages/man1/sha256sum.1.html

# Name of the file containing the password
SECRET_FILENAME='secret.txt';
TEMP_FILENAME='temp.txt';

# Ask user for secret password
read -s -p "Type a secret password:" secretPassword

if [ -f "$SECRET_FILENAME" ]; then

  # Output hash of entered password
  echo "$secretPassword" > $TEMP_FILENAME

  # Read the hash and extract only the hash, don't include the '  -' after the hash
  SECRET_HASH=$(cat "$SECRET_FILENAME" | awk '{print $1}')

  # Validate plain text password in file with secret hash
  checkResult=$(echo "$SECRET_HASH  $TEMP_FILENAME" | sha256sum -c)

  # Remove temp file with users plain text password
  rm -f "$TEMP_FILENAME"

  # If valid hash will 'sha256sum -c'output: 'temp.txt: OK'
  #   otherwise, will 'sha256sum -c' output: 'temp.txt: FAILED'

  # If string contains 'OK' return line,
  #   otherwise, return empty
  hashMatch=$(echo "$checkResult" | grep "OK") 
  
  echo "" # print empty line before result

  # Check match length is not empty
  if [ ! -z "$hashMatch" ]; then
    
    echo "Access Granted"
    exit 0

  else

    echo "Access Denied"
    exit 1

  fi

else

  # Show error and exit with code 2
  echo "Unable to find './$SECRET_FILENAME', please make sure it exists and try again"
  exit 2

fi