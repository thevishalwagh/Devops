#! /bin/bash
FILE="app.log"

if [ -s $FILE ]
then
    echo "file $FILE exists and  is not empty"
else
    echo "File $FILE is empty or does not exists"
fi
    
