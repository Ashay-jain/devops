#!/bin/bash

echo "enter a no."
read a

if [[ $((a % 2 )) == 0 ]]
then 
echo " no $a is even"
else
	echo "no $b is odd"
fi
