#! /bin/bash
read -sp "enter password:" var_spass

var_hash=$(echo $var_spass | sha256sum)

hashfile="secret.txt"
myvariable=$(cat "$hashfile")

echo "1: $var_hash"
echo "2: $myvariable"

if [ "$var_hash" == "$myvariable" ]
then
echo "Access Granted"
exit 0
else
echo "Access Denied"
exit 1
fi

