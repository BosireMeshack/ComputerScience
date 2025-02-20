#!/bin/sh

if [ $1 -eq  `expr $2 \* $3` ]
then
	echo equal
else
	echo not equal
fi
