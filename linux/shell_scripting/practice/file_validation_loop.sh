#!/bin/bash
FILES="app.env db.conf logging.conf"

for file in $FILES
do
    if [ -f "$file" ] && [ -s "$file" ]
    then
        echo "File check: OK ($file is present)"
    else
        echo "File check : FAILED ($file not present)"
        exit 1
    fi
done

echo "All required files are present"
exit 0
