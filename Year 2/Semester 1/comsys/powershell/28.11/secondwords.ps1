$lines=Get-Content $args[0]

foreach($line in $lines)
{
    #Write-Output $line 
    $words = $line.Split(" ")
    Write-Host $words[1]
}
