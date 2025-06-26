with Ada.Text_IO;
use Ada.Text_IO;

with Queue_Pack;
use Queue_Pack;

procedure Main  is
   E: Integer;
  Q1: Queue(5);
  --Some_Element: Integer;
begin
   for I in 1..6 loop
   Put_Line (Integer'Image(I));
   Enqueue (Q1, I);
   end loop;
   New_Line;
   
   --  for I in 1..Q1'Last loop
   --  Put_Line (Natural'Image(Q1(I)));
   --  end loop;
end Main;