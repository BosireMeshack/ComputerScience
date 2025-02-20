$name=Read-Host "Enter name of the user to count"
Write-Host "Counting" $name
(Get-Content .\pass.txt |
    ForEach-Object { $_.Split(':')[4]} |
    Select-String $name |
    Measure-Object).Count