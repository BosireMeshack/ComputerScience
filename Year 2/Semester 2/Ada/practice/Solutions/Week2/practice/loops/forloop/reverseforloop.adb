with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Reverseforloop is
   N: Integer;
   begin
   Put("Enter an integer:");
   Get(N);
   for I in reverse 1..N loop
      Put_Line("Hello, world!" & Integer'Image(I));
   end loop;


   end Reverseforloop;