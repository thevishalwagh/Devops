#! /bin/bash

echo "#############################################################################"
# AUTHOR : VISHAL WAGH
# DATE: 12/01/2026
# THIS IS THE FIRST PRACTICE TASK COVERING BASICS OF SHELL SCRIPT


echo "Date: $(date). "

#hostname
echo "Hostname: $(hostname). "

#username
echo "Username :$(whoami)"


echo "###########################################################################"





VAR=$(df -h)

echo "$VAR"

echo "$(pwd)"
echo "Current executed file is: $0"

echo "Enter Application Name: "
read APPNAME
echo " Welcome to $APPNAME application"
