#!/bin/bash
################################################################
# Author: Vishal Wagh
# Date: 12/01/2026
# This is the Basic Script for learning purpose
###############################################################

# TASK 1: PRINT MESSAGE

#echo "Hello DevOPs World"
#echo "Script Started"

# TASK 2: USE VARIABLES

#ENVM="production"
#APPNAME="webapp"

#echo "This is the $APPNAME application in the $ENVM environment "

#TASK 3: VARIABLE SUBSTITUTION
#DATE=$(date)

#echo $DATE

#TASK4: USER INPUT

echo "Enter the environment: "
read ENVV
echo "Running in $ENVV"


ls /tmp
echo "Exit status code of last command: $?"
