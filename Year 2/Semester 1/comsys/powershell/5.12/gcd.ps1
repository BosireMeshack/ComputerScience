$a=[int]$args[0]
$b=[int]$args[1]

function gcd([int]$c, [int]$d)
{

    if($d -eq 0)
    {
        return $c
    }
    else
    {
        return gcd $d ($c % $d)
    }
}

Write-Output (gcd $a $b)

