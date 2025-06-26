with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure maxtwo is
   
   A: Integer;
   B: Integer;
   
begin
   
   Get(A);
   Get(B);
   
   if A >= B then
      Put(A);
   else
      Put(B);
   end if;
   
end maxtwo;
