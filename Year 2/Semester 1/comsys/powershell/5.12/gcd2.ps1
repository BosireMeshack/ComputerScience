$i = [System.Math]:: Min([int]$args[0], [int]$args[1])

while ($i -gt 1 -and [int]$args[0] % $i -ne 0 -or [int]$args[1] % $i -ne 0)
{
    $i--
}

Write-Output $i