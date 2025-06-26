with Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure add is
Num: Integer;
Sum: Integer:=0;
begin
Get(Num);

for I in 1..Num loop
   Sum:= Sum+I;
end loop;

Put_Line(Integer'Image(Sum));
end add;