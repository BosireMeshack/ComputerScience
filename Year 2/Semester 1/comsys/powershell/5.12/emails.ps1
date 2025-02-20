if (($args.Length -gt 0) -and (Test-Path $args[0] -PathType Leaf)) # checks if the argument is a file , container its checking for a folder
{
    $contents= Get-Content $args[0]

}
# pipeline
#input means you receive sth from the pipeline $Get-Content .\emails.txt | .\email.ps1
else
{
    $contents=$input # gets the input content if the file is missing
}
#for loop, you can't get the length of the pipeline
foreach($line in $contents) #foreach iterates from the start to the end
{
    Write-Output $line.Replace("@", " at ").Replace(".", " dot ")
}