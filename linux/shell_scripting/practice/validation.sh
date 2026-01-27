#!/bin/bash
echo "create a directory"
read -p "Enter directory name: " DIR

mkdir $DIR
if [ $? -ne 0 ]
then 
echo "failed: $DIR not created"
else
echo "Success: $DIR created."
fi
