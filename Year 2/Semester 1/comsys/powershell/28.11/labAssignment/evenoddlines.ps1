$lines=Get-Content $args[0] # Reads lines of a file passed as a commandline argument

for([int] $i = 0; $i -lt $lines.Length; $i++) # Loops through every line of the input file
    {
        if($i % 2 -eq 0) #Checks if the line is even
        {
            $lines[$i] | Out-File -Append even.txt # appends even lines to even.txt
        }
        else 
        {
            $lines[$i] | Out-File -Append odd.txt #appends odd lines to odd.txt
        }
       

    }