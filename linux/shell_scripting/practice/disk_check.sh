#! /bin/bash
THRESHOLD=80
USAGE=$(df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//')
DISKTOTAL=$(df -h / | tail -n 1| awk '{print $2}'| sed 's/%//')
if [ $USAGE -gt $THRESHOLD ]
then
    echo "Warning: Disk usage is $USAGE"
else
    echo "OK: Disk usage is $USAGE out of total $DISKTOTAL"

    
fi
