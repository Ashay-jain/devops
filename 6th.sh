#!/bin/bash
dirc=/home/ubuntu/testing-files
echo " type the file that you want to check"
read a
echo "checking the file ${a} exist or not if not exist will be created"
cd ${dirc}
if [[ -f $a ]]
then
	echo "file exit"
else
	echo "file not found"
	sleep 5
	echo "creating a file  ${a}" 
	touch ${a}
	echo "file create in ${dirc} with name ${a}"
fi
