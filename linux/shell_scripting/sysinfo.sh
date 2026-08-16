#!/bin/bash
SERVER=$(hostname)
echo "=== Server Health : $SERVER ==="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime)"
echo "--- Free Memory (MB) ---"
free -m
echo "--- Disk Usage ---"
df -h

DISK_USAGE=$(df / | awk 'NR==2 { gsub("%", ""); print $5}')
#DISK_USAGE=81
if [ "$DISK_USAGE" -gt 80 ]; then
    echo "ALERT: Disk space has 20% limit"
else
    echo "DISK SPACE IS UNDER LIMIT"
fi

SERVICES="docker sshd nginx"
#check_service(){
   # for i in $SERVICES; do
     #   STATUS=$(systemctl is-active $i)
    #    if [ "$STATUS" = "active" ]; then 
   #         echo "service status $i: $STATUS"
  #      else  
  #          echo "ALERT service status $i: FAILED"
 #       fi 
 #   done
#}
#check_service

check_service(){
        STATUS=$(systemctl is-active $1)
        if [ "$STATUS" = "active" ]; then
            echo "Service STATUS $1: Active"
        else
            echo "Service STATUS $1: IN-ACTIVE"
            fi
        }

        check_service docker
        check_service sshd
        check_service nginx
