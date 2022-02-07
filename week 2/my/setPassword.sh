#! /bin/bash


echo "enter folder name"
read foldername

mkdir $foldername

read -sp 'Enter Password' pass_var

echo $pass_var | sha256sum >./$foldername/secret.txt

 





