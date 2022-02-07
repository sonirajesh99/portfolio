#!/bin/bash

DownloadURL=""
EXIT_COMMAND='exit'

while [ "$DownloadURL" != "$EXIT_COMMAND" ]; do
  #Prompt user for URL to download
  read -p "Please type the URL of a file to download or type '$EXIT_COMMAND' to quit: " DownloadURL

  # Don't prompt for save path if user has selected to exit
  if [ "$DownloadURL" != "$EXIT_COMMAND" ]; then
    read -p 'Type the location of where you would like to download the file to: ' SavePath

    # Replace tilde with home path
    SavePath="${SavePath/#\~/$HOME}"

    # Check directory exists
    if [ -d "$SavePath" ]; then
      wget -P "$SavePath" "$DownloadURL"
    else
      echo "Cannot save to '$SavePath' as it's not a valid directory"
    fi
  fi

done

exit 0