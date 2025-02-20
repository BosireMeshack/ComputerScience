Param(
    [Parameter(Mandatory=$true)][int]$n
)
$binary=""

do{
    
    $x=$n%2
  
    $binary = [string]$x + $binary
    $n=[Math]::Floor($n/2)

}
until($n -eq 0)

if ($binary -eq "")
{
    $binary=0
}

Write-Output $binary