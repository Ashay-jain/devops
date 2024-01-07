#!/bin/bash
exclude=renaming.sh
echo "showing all files with .sh extension"
for i in *
do
	if [[ $i == *.sh ]] && [[ $i != $exclude ]]
	then

	echo "the file are $i"
	echo "now chaning all files extension to .txt"
	mv $i  "${i%.sh}.txt"
	echo "File changed ${i%.sh}.txt"
	sleep 1
	fi


done 

