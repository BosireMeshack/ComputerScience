with Ada.Text_IO; 
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Whileloop is
   N: Integer;

   begin

   Put("Enter an integer: ");
   Get(N);
   for I in 1..N loop
      Put_Line("Hello, World!" & Integer'Image(I));
      end loop;

   end Whileloop;