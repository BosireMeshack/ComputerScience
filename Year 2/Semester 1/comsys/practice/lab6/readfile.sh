#!/bin/sh

counter=0
while read -r x #read file line-by-line. x: contents of the current line
do
	echo $counter line: $x
	if [ `expr $counter % 2` -eq 0 ]
	then
		echo $x >> even.txt
	else
		echo $x >> odd.txt	
	fi
	counter=`expr $counter + 1`
done < $1 #name of the file which we want tp read/open
