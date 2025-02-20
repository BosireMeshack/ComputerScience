Write-Output "Hurray Fradi"
$a="asd"
Write-Host First argument: $args[0]
Write-Host Second argument: $args[1]

$myArray = 4,7,3,2,9
Write-Host $myArray[1]

# ASSOCIATE ARRAY
$map = @{'a'=1; 'b'=2; 'c'=3}

Write-Host $map['b']
Write-Host $map.c 