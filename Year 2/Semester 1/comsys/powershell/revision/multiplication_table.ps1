Param(
    [Parameter(Mandatory=$true)][int]$n
    )


for([int]$i=1; $i -le $n; $i++)
{
     Write-Output "Line $i`n"
     $product=""
    for([int]$j=1; $j -le $n; $j++)
    {
        $product=$product + " " + [string]($i*$j) 
    }
    Write-Output $product
   
}


