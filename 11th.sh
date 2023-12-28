#!/bin/bash
# check the files are regular file or directory or any other file in a folder
echo "type the name of the file"
read a

if [ -f "$a" ]
then
	echo " this is a regular file ${a}"
elif [ -d "$a" ] 
then
	echo "this is a directory ${a}"
else 
	echo "${a} is of another type"
fi
