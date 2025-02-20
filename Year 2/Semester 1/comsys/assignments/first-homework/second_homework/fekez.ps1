
 [int]$k=$args[0]

 $distance_to = (Get-Content .\car_data.txt |
    ForEach-Object { $_.Split(" ")[4]}
   )

# foreach( $d in $distance_to)
#     {
#         if([int]$d -lt $k)
#         {
#             Write-Output "Break"
#         }
#     }
for([int] $i=0; $i -lt $distance_to.Length-1; $i++)
{
    if([int]$distance_to[$i] -lt $k)
    {
        Write-Output "Break"
       
    }
}