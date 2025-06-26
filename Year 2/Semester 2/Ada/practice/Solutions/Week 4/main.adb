with Ada.Text_IO, Queue_Pack, Ada.Command_Line, Ada.Integer_Text_IO;
use Ada.Text_IO, Queue_Pack, Ada.Integer_Text_IO;


procedure Main is

   E: Integer;
   Q1: Queue(5);

   --Q2: Queue(Ada.Command_Line.Argument_Count);
   --  res: Integer:=10;
   --  A: Integer :=3;

begin

   for I in 1..7 loop
      Put_Line(I'Image);
      Enqueue(Q1, I);
   end loop;

   --   for I in 1..10 loop
   --   case I is
   --   when 1|3|5|7|9 => Put("Odd" & " ");
   --   when 2|4|6|8|10 => Put("Even" & " ");
   --   end case;
   --  end loop;

   --  while A/=1 loop
   --     res:= res*A;
   --     A:=A-1;
   --  end loop;
   --  Put(res);

   --  for I in 1..Ada.Command_Line.Argument_Count loop
   --     E := Integer'Value(Ada.Command_Line.Argument(I));
   --     --Enqueue(Q2, E);
   --     Put_Line(Integer'Image(E));
   --  end loop;



end Main;
