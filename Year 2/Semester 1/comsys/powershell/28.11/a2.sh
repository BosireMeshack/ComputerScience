#!/bin/sh

argc=$#

ref=$1


#c=0
#while [ $c -lt $argc ]
#do
if [ $argc -lt 1 ]
then
	echo Enter 1 or more arguments
else 
	for i in $*
	do
		if [ $i -lt $ref ]
		then
			echo $i
		fi
	done
fi
#	c=`expr $c + 1`
#done  

#echo $argc
