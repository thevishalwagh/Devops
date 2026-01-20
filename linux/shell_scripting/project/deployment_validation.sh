#!/bin/bash
echo "#################################################################################################################"
echo "NAME: DEPLOYMENT VALIDATION"
echo "AUTHOR: VISHAL WAGH"
echo "DATE: 19/01/2026"
echo "This script is used to validate whether a system is ready to run an application based on risk and policy"
echo "##################################################################################################################"

#Input Validation

read -p "Enter Application Name: " APP_NAME

if [ -z "$APP_NAME" ]
then
    echo "FAILURE: Application Name is REQUIRED."
    exit 1
else
    echo  "Application Name: $APP_NAME"
fi

#Check Log Directory

DIR="logs/$APP_NAME"
if [ -d "$DIR" ]
then
    echo "Directory Check: OK ($DIR Exists)"
else
    echo "Directory Not Exists"
    mkdir -p  "$DIR"

      if [ $? -ne 0 ] 
      then
        echo "Directory check: FAILED"
        exit 1
      fi
                                                                
    echo "Directory check: Ok ($DIR Created)"
fi

#Check Log File

FILE="$DIR/app.log"
if [ -f "$FILE" ]
then
    echo "LOG File Check: OK ($FILE Exists)  "
    if [ -s "$FILE" ]
    then 
        echo "LOG File contains data"
    else
        echo "WARNING: LOG FILE is EMPTY"
        fi
else
  echo "LOG File Does not exits"
  echo "Creating Log File..."
  touch "$FILE"

  echo "Log File Check: OK ($FILE Created)"
fi

#Check Disk Usage

DISK_USAGE=$(df /| tail -1 | awk '{ print $5}'| sed 's/%//' )

if [ "$DISK_USAGE" -gt 90 ]
then 
    echo " Disk Check: FAILED (${DISK_USAGE}%) "
elif [ "$DISK_USAGE" -ge 80 ]
then 
    echo "Disk Check: WARNING  (${DISK_USAGE}%)"
else 
    echo " Disk Check: OK (${DISK_USAGE}%)"
    exit 1
 fi

#Check Service Status"

SERVICE_NAME="ssh"
if systemctl is-active --quiet "$SERVICE_NAME"
then
    echo " Service Check: OK ($SERVICE_NAME is Running)"
else
    echo "Service Check: FAILED ($SERVICE_NAME Service is not Running) "
    exit 1
fi

#Final STATUS"
echo "Application PRE-DEPLOYMENT check: PASSED."
exit 0
