Param(
    [Parameter(Mandatory=$true)][int]$n,
    [Parameter(Mandatory=$true)] [int]$m

    )

function isPrime([int]$a)
{
    if($a -le 1)
    {
        return $false    
    }
    for($i=$a-1;$i -ge 2; $i--)
    {
        if($a % $i -eq 0)
        {
            return $false
        }
    }
    return $true
}

for([int]$i=$n;$i -le $m; $i++)
{
    if(isPrime($i))
    {
        Write-Output($i)
    }
}


