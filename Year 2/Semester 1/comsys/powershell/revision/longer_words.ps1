# Param(
#     [Parameter(Mandatory=$true)][int]$n
# )
$n =4

# $lines = Get-Content $args[0]

# foreach ($line in $lines)
# {
#     $name = $line.Split(" ")
#     if($name[0].Length -gt $n)
#     {
#         Write-Output $name[0]
#     }
# }

Get-Content $args[0] |
    ForEach-Object { $_.Split(' ')[0]} |
    Where-Object {$_.Length -gt $n} |
    ForEach-Object {Write-Output $_ }

