#!/bin/bash
## script to check status of command 
cat /etc/passwd

if [ "$?" == 0 ]
then
	echo "command run successfully"
	exit 0
else 
	echo " command not run successfully"
	exit 1
fi


