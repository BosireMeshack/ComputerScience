Param(
    [Parameter(Mandatory= $true)] [int] $n
)

[int]$term1=1
[int]$term2=1
[int]$nextTerm=$term1+$term2
Write-Output($term1)
Write-Output($term2)
for([int]$i=3;$i -le $n; ++$i)
{
    
    Write-Output($nextTerm)
    $term1=$term2
    $term2=$nextTerm
    $nextTerm=$term1+$term2
}