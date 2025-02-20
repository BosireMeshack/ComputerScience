$rand = New-Object System.Random
$number = $rand.Next(1,100)

do 
{
    [Int]$guess = Read-Host "Guess?"
    if ($guess -lt $number)
    {
        Write-Output " Guess less than answer"
    }
    else {
        if($guess -gt $number)
        {
            Write-Output "Too Large"
        }
        else {
            Write-Output "GGMU"
        }
    }

}
until ($guess  -eq $number)