#! /bin/bash

echo "######################################################################################"

echo "USERNAME: $(whoami)"

echo "HOSTNAME: $(hostname)"
echo "DATE: $(date +"%Y-%m-%d")"
echo "This is the script for checking service"

echo "######################################################################################"

SERVICE="ssh"

if systemctl is-active --quiet "$SERVICE";
then
echo "Service is running: $SERVICE"
else
echo "Service is not running: $SERVICE"
fi
