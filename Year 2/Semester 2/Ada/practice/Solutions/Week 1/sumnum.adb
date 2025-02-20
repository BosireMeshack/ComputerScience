with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure sumnum is
   
   N: Integer := 0;
   Sum: Integer := 0;
   
   --<> - not equals
begin
   
   Get(N);
   
   --for (int i = 0; i < some_val; i += 3)
   for I in 1..N loop
      Sum := Sum + I;
   end loop;
   
   Put(Sum);
   
end sumnum;
