with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure aproxe is
-- Factorail function on a loop
   function Facto(N:Integer) return Positive is 
      Fact: Integer := 1;
   begin 
      for I in 1..N loop
         Fact := Fact * I;
      end loop;
      return Fact;
   end Facto;
E : Float := 1.0;

-- main function
begin

for I in 1..10 loop
  E:=  E + (1.0 / Float(Facto(I)));
end loop;
Put(E);
end aproxe;
