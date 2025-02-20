if [ $# -ne 1 ];then 
echo " please input: "
read -p "enter: " n
else 
n=$1
fi
echo the evennumber $n is :$((2*$n))