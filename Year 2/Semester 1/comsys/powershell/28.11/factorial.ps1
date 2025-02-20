Param (
    [Parameter(Mandatory=$true)]
    [int]$n
)
$result=1
for([int]$i=1;$i -le $n;$i++)
{
    $result=$result*$i
}
Write-Output($result)