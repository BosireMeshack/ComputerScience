#gets filenames as parameter
# Prints the lines of the file in reverse order
$lines=Get-Content $args[0]

for([int] $i=$lines.Length-1; $i -ge 0; $i--)
{
    Write-Output $lines[$i]
}

# [Array]::Reverse($lines)
#Write-Host $lines