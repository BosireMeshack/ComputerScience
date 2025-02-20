if [ $# -ne 1 ]; then
   read -p "enter lines: " line
else
   line=$1
fi

for ((i=0;i<line;i++));do
    for ((j=0;j<line;j++)); do
       printf A
    done
    echo
done
echo
