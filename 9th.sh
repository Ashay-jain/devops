#!/bin/bash

##q Write a shell script that searches for all files with a ".txt" extension in a specified directory and its subdirectories. The script should display the names of these files along with the total number of ".txt" files found.

for i in *.txt
do
 	if [[   -f "$i"  ]]
	then
		echo "file name is ${i}"
#	else 
#		echo "there is no file of .sh"
	fi
#echo "all file ${i} "
done 

