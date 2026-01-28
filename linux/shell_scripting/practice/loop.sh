#!/bin/bash

SERVICE="ssh"
RETRIES=5
COUNT=0

while [ $COUNT -lt $RETRIES ]
do 
    if systemctl is-active "$SERVICE"
     then
        echo "Service check :PASSED - $SERVICE is running. "
        exit 0
    else
        echo "Service check :FAILED - $SERVICE is not running. Retrying... ($((COUNT+1))/$RETRIES)"
    fi
    COUNT=$((COUNT + 1))
    sleep 3
done

echo "SERVICE did not start after $RETRIES attempts. Exiting with FAILURE."
exit 1