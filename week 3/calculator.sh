#!/bin/bash

# Prompt for two integers
echo "Please enter two integers:"
read -p "First: " int_first
read -p "Second: " int_second

# Display menu
echo "Select an operation:"
echo -e "\033[34m1. Addition"
echo -e "\033[32m2. Subtraction"
echo -e "\033[31m3. Multiplication"
echo -e "\033[35m4. Division \033[0m" # Reset text back to default

# Ask for operation
read -p "Enter choice: " operation

#store default result, colour and exit code
result="An error occurred"
colour="\033[0m"
code=0

# Perform operation
case $operation in

  1) # Addition
    result=$(expr "$int_first" + "$int_second")
    colour="34"
  ;;

  2) # Subtraction
    result=$(expr "$int_first" - "$int_second")
    colour="32"
  ;;

  3) # Multiplication
    result=$(expr "$int_first" \* "$int_second")
    colour="31"
  ;;

  4) # Division
    result=$(expr "$int_first" / "$int_second")
    colour="35"
  ;;

  *)
    result="Unknown operation selected"
    code=1
  ;;

esac

# Default message
message="\033["$colour"mResult:"

# If operation was invalid, show error
if [ "0" -ne "$code" ]; then
  message="\033[31mError:"
fi

# Display result to user
echo -e "$message \033[0m$result"

# Exit with appropriate code
exit "$code"