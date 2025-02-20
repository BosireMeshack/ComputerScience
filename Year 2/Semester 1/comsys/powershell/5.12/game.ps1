$rand = New-Object System.Random
[int]$number = $rand.Next(1, 100)



$correct=$false

while(-not $correct)
{
    $guess = Read-Host "Enter a number:"
    if($guess -eq $number)
    {
        $correct = $true
        Write-Output "Correct"
        
    }
    elseif($guess -lt $number)
    {
        Write-Output "Guess less than number"
    
    }
    else
    {
        Write-Output "Guess greater than number"
       
    }
}

