#!/bin/bash
echo "-------------------------------------------------------------------------"
echo "AUTHOR    : $(whoami)"
echo "DATE      : $(date '+%Y-%m-%d')"
echo "DIRECTORY : $(pwd)"
echo "SCRIPT    : $0"
echo "PURPOSE   : System prechecks before application deployment"
echo "--------------------------------------------------------------------------------"

echo "######## checking Directory #######"
DIR="logs"

if [ -d "$DIR" ]; then
  echo "Directory check: OK ($DIR exists)"
else
  echo "Directory missing: creating $DIR"
  mkdir "$DIR"
# lets check directory created or not
  if [ $? -ne 0 ]; then    
    echo "Directory check: FAILED"
    exit 1
  fi
  echo "Directory check: OK (created)"
fi

FILE="$DIR/app.log"

if [ -f "$FILE" ]; then
  if [ -s "$FILE" ]; then
    echo "Log file check: OK (exists and has content)"
  else
    echo "Log file warning: exists but empty"
  fi
else
  echo "Log file missing: creating $FILE"
  touch "$FILE"
  if [ $? -ne 0 ]; then
    echo "Log file check: FAILED"
    exit 1
  fi
  echo "Log file check: OK (created)"
fi

LIMIT=85
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$LIMIT" ]; then
  echo "Disk check: FAILED (${USAGE}% > ${LIMIT}%)"
  exit 1
else
  echo "Disk check: OK (${USAGE}%)"
fi

SERVICE="ssh"

if systemctl is-active --quiet "$SERVICE"; then
  echo "Service check: OK ($SERVICE running)"
else
  echo "Service check: FAILED ($SERVICE not running)"
  exit 1
fi

echo "--------------------------------------------------------------------------------"
echo "SYSTEM PRECHECK: PASSED"
exit 0

