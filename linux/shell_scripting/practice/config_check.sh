#! /bin/bash
 FILE="app.conf" # declaring varible
 
 if [ -f "$FILE" ] && [-s "$FILE" ]
 then
     echo "$FILE exists and not empty"
 else
     echo "$FILE does not exists"
 fi

 
