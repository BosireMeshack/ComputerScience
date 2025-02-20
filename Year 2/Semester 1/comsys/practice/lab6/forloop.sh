
#!/bin/sh

sum=0
if [ $# -ne 5 ]
then
 	for i in `seq 5`
	do
		echo Enter number $i
		read i
		sum=`expr $sum + $i`

done
else
	for i in $*
	do
	sum=`expr $sum + $i`
	done
fi

echo Sum: $sum

#for i in $*
#do


#done
