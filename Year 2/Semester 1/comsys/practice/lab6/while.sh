
#!/bin/sh

i=0
sum=0
while [ $i -lt 5 ]
do
	read x
	sum=`expr $sum + $i`
	i=`expr $i + 1`

done
echo Sum: $sum


