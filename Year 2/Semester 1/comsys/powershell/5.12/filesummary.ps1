Param(
    [Parameter(Mandatory=$true)]$directory
)
#function that calculates the size of files in a directory
function GetDirectorSize($dir)
{
    $size=0
    if(Test-Path $dir -PathType Container) #Checks if the path is a foldter
    {
        $length = Get-ChildItem $dir #gets all the files in a folder
        foreach($file in $length) #loops through each file in the folder
        {
            if (Test-Path $file.FullName -PathType Leaf) #checks if path is a file
            {
                $size+=$file.Length #accumulates the size of the files
            }
            else
             {
               $size+=GetDirectorSize($file) # recursively calls the function for subfolders
             }
        }
    }
    

    return $size
}

Write-Output (GetDirectorSize($directory)) #calling the function