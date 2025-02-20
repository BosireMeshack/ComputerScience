#!/bin/sh

if [ -z "$1" ]
then
	echo "No commandline argument provided"
	exit 1
fi

c=$1
fact=1
if [ "$c" -eq 0 ]
then 
	echo Factorial: 1
else

	while [ "$c" -gt 0 ]
	do
	fact=`expr $fact \* $c`
	c=`expr $c - 1`
	done


echo Factorial: $fact
fi 	
