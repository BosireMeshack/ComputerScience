with Ada.Integer_Text_IO; with Ada.Text_IO;
use Ada.Integer_Text_IO; use Ada.Text_IO;

procedure iseven is
N: Integer;
begin
   Get(N);
   if(N mod 2 = 0) then 
      Put_Line("Is even");
   else 
      Put_Line("Is Odd");
   end if;
end iseven;