#!/bin/bash

#############################################################################
# AUTHOR  : VISHAL WAGH
# DATE    : 12/01/2026
# PURPOSE : Day 1 shell scripting practice for production automation
#############################################################################

echo "======================================"
echo "Date        : $(date '+%Y-%m-%d %H:%M:%S')"
echo "Hostname    : $(hostname)"
echo "User        : $(whoami)"
echo "Directory   : $(pwd)"
echo "Script Name : $0"
echo "======================================"

echo ""
echo "Disk usage (root filesystem):"
df -h /

echo ""
echo "Enter application name:"
read APPNAME

echo "Welcome to $APPNAME application"

