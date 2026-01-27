#!/bin/bash
echo '--loop--'
set -x
#variable declaration

SERVICES="ssh docker cron" 

#Applying for loop using service as loop variable

for service in $SERVICE 
do
    #checking systemctl service is running or not
    if systemctl is-active --quiet "$SERVICE"
    then
        echo "service check: OK ($SERVICE running)"
    else
        echo "service check: FAILED($SERVICE not running)"
        exit 1
    fi
done
echo "ALL REQUIRED SERVICES ARE RUNNING"
exit 0
