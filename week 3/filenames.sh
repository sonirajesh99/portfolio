#!/bin/bash

#List filename
LIST_FILENAME=$1

if [ ! -f "$LIST_FILENAME" ]; then
  echo -e "\033[31mError: \033[0m'$LIST_FILENAME' not found"
  exit 1
fi

cat "$LIST_FILENAME" | while read line; do
  # Track if item was found
  result="\033[31mI don't know what that is!\033[0m"

  # Check for file
  [ -f "$line" ] && result="\033[32m$line \033[0m- That file exists"

  # Check for directory
  [ -d "$line" ] && result="\033[34m$line \033[0m- That's a directory'"

  echo -e "$result"

done