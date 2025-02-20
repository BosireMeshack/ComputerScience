#!/bin/sh

file="number.dat"

while read -r line
do
	case $2 in
		 -a)
		   sum=`expr $1 + $line`
		   echo $sum >> $file
		   ;;
		 -s)
		   diff=`expr $line - $1`
		   echo $diff >> $file
		   ;;
	         -m)
    		  pro=`expr $line \* $1`
		   echo $pro >> $file
   		  ;;
  	         -d)
 		 d=`expr $line \/ $1`
		  echo $d >> $file
	          ;;
		 *)
		  echo Unknown operator
		  ;;
     	esac	
	
done < "$file"
