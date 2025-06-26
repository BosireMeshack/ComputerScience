with Ada.Integer_Text_IO;
with Ada.Text_IO;

use Ada.Integer_Text_IO, Ada.Text_IO;

procedure max is
num1: Integer;
num2: Integer;
begin
Get(num1);
Get(num2);

if (num1 > num2) then 
   Put(num1);
else 
   Put(num2);
end if;
end max;