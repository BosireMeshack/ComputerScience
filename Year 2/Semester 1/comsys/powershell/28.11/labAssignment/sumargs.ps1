$len = $args.Length # Gets the length of commandline args
$sum=0  #initializes sum to 0
for([int]$i=0;$i -lt $len; $i++) # loops through the commandline-args
{
    $sum=$sum+$args[$i] #Sums the commandline args
}
Write-Output "Sum of input arguments:$sum" #Outputs the sum