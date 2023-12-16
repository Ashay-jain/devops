#!/bin/bash

echo "please enter 1st no."
read a
echo "please enter second no."
read b
echo "please enter third no."
read c

if [[ $a -gt $b && $a -gt $c ]]
then 
	echo "a is greates ${a} "
elif [[ $b -gt $a && $b -gt $c ]]
then
	echo "b is greatest ${b}"
else
	echo "c is greatest ${c}"
fi

