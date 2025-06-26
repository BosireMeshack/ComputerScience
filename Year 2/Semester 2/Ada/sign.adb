with Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure sign is
   Num: Integer;
begin
   Get(Num);

   if Num=0 then
      Put(0);
   elsif Num > 0 then
      Put(1);
   else 
      Put(-1);
   end if;
end sign;