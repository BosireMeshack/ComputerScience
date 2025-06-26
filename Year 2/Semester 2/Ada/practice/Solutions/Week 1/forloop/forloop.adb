
with Ada.Text_IO;
use Ada.Text_IO;

procedure forloop  is
   N: Integer;
   C: Integer;
begin
   N:=100;
   for I in 0..N loop
      Put_Line(Integer'Image(I));
   end loop;
end forloop;