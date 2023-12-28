#!/bin/bash

#echo "type the name of the file"
#read a

if [ -f "$1" ]
then
	echo " this is a regular file ${1}"
elif [ -d "$1" ] 
then
	echo "this is a directory ${1}"
else 
	echo "${1} is of another type"
fi
