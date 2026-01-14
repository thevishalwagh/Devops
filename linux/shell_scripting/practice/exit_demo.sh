#! /bin/bash
ls /wrong/path
if [ $? -ne 0 ]
then
    echo "command failed"
    exit 1
   else
       echo "command succeeded"
       exit 0
      fi
