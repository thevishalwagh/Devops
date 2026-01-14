#! /bin/bash
# check directory if present show message its present if not then create

DIR="logs"

if [ -d $DIR ]
then
	echo "Directory $DIR already exists"
else
	echo "Diectory $DIR does not exists"
        echo " $DIR creating"

	mkdir "$DIR"

	echo "Directory $DIR created successfully"
fi

