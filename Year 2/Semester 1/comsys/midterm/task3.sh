total=0
while IFS="," read -r word num word ;do
  total=$((total + num))
done < "$1"
echo total: $total