#!/bin/bash
#File creation using loops

for f in {1..5}
do
    touch file${f}.txt
done
echo "newly created files are: " 
ls -l *.txt
