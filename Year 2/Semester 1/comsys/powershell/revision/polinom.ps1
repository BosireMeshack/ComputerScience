Param(
    [Parameter(Mandatory=$true)] [int] $a,
    [Parameter(Mandatory=$true)] [int] $b,
    [Parameter(Mandatory=$true)] [int] $c,
    [Parameter(Mandatory=$true)] [int] $d,
    [Parameter(Mandatory=$true)] [int] $n,
    [Parameter(Mandatory=$true)] [int] $m
)

for([int]$i=$n; $i -le $m; $i++)
{
    $pol = $a*[Math]::Pow($i, 3)+ $b*[Math]::Pow($i, 2)+ $c*[Math]::Pow($i, 1) + $d
    Write-Output $pol
}
