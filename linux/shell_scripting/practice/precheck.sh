#!/bin/bash
echo "----------------------------------------------------------------"
echo "AUTHOR: $(whoami)"
echo "DATE: $(date '+%Y-%m-%d')"
echo "SCRIPT: $0"
echo "THIS IS PRECHECK SCRIPT"
echo "----------------------------------------------------------------"

#directory validation
DIR="applogs2"

if [ -d $DIR]
then
echo "Directory exists"
else
echo "Warning: Directory missing. Creating directory..."

mkdir "$DIR"
	if [ $? -ne 0 ]
	then
		echo "Directory check: failed (Exiting...)"
		exit 1
	fi
	echo "Directory check : OK (Directory created)"
fi

# log file creation
LOGFILE="$DIR/ap2p.log"

if [ -f "$LOGFILE" ]; then
  if [ -s "$LOGFILE" ]; then
    echo "Log file check: OK (has content)"
  else
    echo "Log file warning: exists but empty"
  fi
else
  echo "Log file missing: creating $LOGFILE"
  touch "$LOGFILE"
  if [ $? -ne 0 ]; then
    echo "Log file check: FAILED"
    exit 1
  fi
  echo "Log file check: OK (created)"
fi


# disk usage

LIMIT=80
USAGE=$([ df -h / | tail -n 1 | awk '{print $5}'| sed 's/%//'])

if [ $USAGE -gt $LIMIT]
	then 
	echo "Disk check :FAILED (${USAGE}% > ${LIMIT}%)"
	exit 1
else
	echo "Disk check: OK (${USAGE}%)"
fi

# service status

SERVICE="ssh"

if systemctl is-active --quiet "$SERVICE" 
then
	echo "Service check : OK ({$SERVICE} running)"
else
	echo "Service check: FAILED"
fi

#final verdict
echo "System Precheck Passed."
exit 0
