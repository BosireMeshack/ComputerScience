<#
Multi-line comment
#>

$files=Get-ChildItem
for ([int]$i=0; $i -lt $files.Length; $i++)
{
    if(Test-Path -Path $files[$i] -PathType Leaf)
    {
        Write-Output $files[$i].Name
     }
}

foreach ($file in $files) 
{ 
    if(Test-Path -Path $file -PathType Leaf)
    {
        Write-Output $file.Name
     }

}

(Get-ChildItem -File).Name 