if ($args.Length -lt 2)
{
    Write-Host Not enough args
    exit
}


Write-Host Sum: ($args[0] + $args[1])

Write-Host Difference: ($args[0] - $args[1])

Write-Host Product: ($args[0] * $args[1])
Write-Host Quotient: ($args[0] / $args[1])
Write-Host Power: ([Math]::Pow($args[0] , $args[1]))
